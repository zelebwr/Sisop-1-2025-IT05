#!/bin/bash

#downloading the csv file
DATA=$(curl -s -L "https://drive.google.com/uc?export=download&id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV")

#printing the options
echo "##########################
Selamat Datang Di Suka Maju Data & Learning

Ketik :
1. Mencari Data Chris Hemsworth
2. Mencari Rata-Rata Durasi Membaca Dengan Tablet
3. Mencari Pembaca Dengan Rating Tertinggi
4. Mencari Genre Ter-Populer Di Atas 2023"

read -p "Masukkan Menu Pilihanmu : " menu

if [ "$menu" -eq 1 ]; then   
echo "$DATA" | awk -F',' '
NR==1 {next}
$2 == "Chris Hemsworth" {count++} 
END {printf "Chris Hemsworth membaca %d buku.\n", count}
'

elif [ "$menu" -eq 2 ]; then
echo "$DATA" | awk -F',' '
NR==1 {next}
$8 == "Tablet" { total += $6; count++ }
END {printf "Rata-rata durasi membaca dengan Tablet adalah %.1f menit.", total/count}'

elif [ "$menu" -eq 3 ]; then
echo "$DATA" | awk -F',' '
NR==1 {next}  # Skip header
$7 > ratingMax {ratingMax=$7; count=0}  # Reset jika ada rating lebih tinggi
$7 == ratingMax {arr[count++] = $2 " - " $3}  # Simpan dalam array jika rating sama
END {printf "Pembaca dengan rating tertinggi (%.1f):\n", ratingMax;
    for (i=0; i<count; i++)
    {
        printf "%d. %s\n", i+1, arr[i];
    }
}'

elif [ "$menu" -eq 4 ]; then
echo "$DATA" | awk -F',' '
NR==1 {next}
substr($5, 1, 4) > "2023" && $9 == "Asia" { genreCount[$4]++ }
END {
    genremax = ""; hitungmax = 0;
    for (g in genreCount)
    {
        if (genreCount[g] > hitungmax)
        {
            hitungmax = genreCount[g];
            genremax = g;
        }
    }
    if (genremax != "")
        printf "Genre paling populer di Asia setelah 2023 adalah %s dengan %d buku.\n", genremax, hitungmax;
}'
fi
