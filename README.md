# Sisop-1-2025-IT05

## A. Repo Structure Setup

This is simply done by using the `mkdir` and `touch` command. 

Here is the following command we used: 

```bash
$ mkdir -p soal_1 soal_2/scripts soal_3 soal_4 && touch ./soal_1/poppo_siroyo.sh ./soal_2/login.sh ./soal_2/register.sh ./soal_2/scripts/core_monitor.sh ./soal_2/scripts/frag_monitor.sh ./soal_2/scripts/manager.sh ./soal_2/terminal.sh ./soal_3/dsotm.sh ./soal_4/pokemon_analysis.sh

```

## B. Local Repo Setup

### 1. Clone Remote Repository

We can clone the remote repo to our local repo by using the [HTTPS Link](https://github.com/zelebwr/Sisop-1-2025-IT05.git) or the [SSH Link](git@github.com:zelebwr/Sisop-1-2025-IT05.git) and then simply use the following command:

```bash
$ git clone <link>
```

### 2. Enable All File's Run Permission

We can easily enable the run permission on every file by using the -R (recursive) flag after moving to the local repo in our device. Do this command when met with **Running** permission problem:

```bash
$ chmod -R +x .
```

## C. Challenge Operation

### Soal 1 – Poppo Siroyo Adventure^^
First thing to be done is to declare the shell environment with: 

```bash
#!/bin/bash
```

The above is to declare that shell will be run in a bash shell environment.
Next, download the csv file using **curl**.

```bash
DATA=$(curl -s -L "https://drive.google.com/uc?export=download&id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV")
```

Don't forget to give your program a menu-to help Poppo&Siroyo deciding their choice.

```bash
echo "##########################
Selamat Datang Di Suka Maju Data & Learning

Ketik :
1. Mencari Data Chris Hemsworth
2. Mencari Rata-Rata Durasi Membaca Dengan Tablet
3. Mencari Pembaca Dengan Rating Tertinggi
4. Mencari Genre Ter-Populer Di Atas 2023"
```

You also have to collect their choice, use ↓↓↓

```bash
read -p "Masukkan Menu Pilihanmu : " menu
```

Now we're moving to the challenges they'll face!
1. Poppo is eager to know how many books Chris Hemsworth has read! Let's build a system that fetches and processes the data to reveal the answer.

```bash
if [ "$menu" -eq 1 ]; then
echo "$DATA" | awk -F',' '
NR==1 {next}
$2 == "Chris Hemsworth" {count++}
END {printf "Chris Hemsworth membaca %d buku.\n", count}
'
```
> Using if feature, adjusting Poppo&Siroyo needs. Try to show the data and filter Chris's name.

2. Siroyo, always the analyst, wants to know how long people read using the magic tablet. Let's build a system that fetches and processes the data to reveal the answer.
   
```bash
elif [ "$menu" -eq 2 ]; then
echo "$DATA" | awk -F',' '
NR==1 {next}
$8 == "Tablet" { total += $6; count++ }
END {printf "Rata-rata durasi membaca dengan Tablet adalah %.1f menit.", total/count}'
```
> Using if feature, adjusting Poppo&Siroyo needs. Try to show the data and count the average time of people reading by Tablets.

3. While Siroyo is busy analyzing the magic tablet, Poppo comes up with a brilliant idea. 'If we already know how they read, I want to reward the friend who loves their book the most!' Poppo then sets out to find the person who gave the highest rating, along with their name and the book title.

```bash
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
```
> Using if feature, adjusting Poppo&Siroyo needs. Try to show the data and find the highest rate given by the readers.

4. Siroyo needs a stellar book club report! Curious about Asia’s top genre after 2023, he reopens reading_data.csv.

```bash
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
```
> Using if feature, adjusting Poppo&Siroyo needs. Try to show the data and discover the best (top) genre of books after 2023.

The last thing needed to do is to "close" the program using this magic word↓↓↓

```bash
fi
```


### Soal 2 – Game Kece

### Soal 3 – CLI UI/UX Gacor

### Soal 4 – Main Pokemon Malah Pusing Sendiri

#### Declare Shell Environment

First thing to be done is to declare the shell environment with: 

```bash
#!/bin/bash
```

The above is to declare that shell will be run in a bash shell environment.

And now we can get straight into the sub-challenges 

#### Challenge Overview

The challenge has several objectives: 

1. Make a **summary** out of pokemon data

>   > Must show pokemons with the highest Usage% and RawUsage value

2. Sort table based on a column

>   > Must 

3. Lookup value of 

>   > 

4. bla bla

>   > This is template

#### Function Declaration

The first thing that we need to do is that 

```bash 
ini adalah function
```

Ini adalah penjelasan mengenai bagaimana function tersebut bekerja

#### If-else Tree Branch

```bash
ini adalah if-else tree branch
```

#### Last Condition to Write Output

```bash 
ya pokoknya ada lah ya
```

#### Solve Data Summary _with a little added_

This is the command to run the script for solving the first sub-challenge:

```bash 
$ ./pokemon_analysis.sh --info
```

> Note: every solve command should be run at **_$USER/Sisop-1-2025-IT05/soal_4_** directory

Here's the result:

"picture" masih blm kutambahkan

dkk dan selanjutnya, semangat semua

