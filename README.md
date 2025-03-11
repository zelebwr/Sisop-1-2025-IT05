# Sisop-1-2025-IT05

## Repo Structure Setup

This is simply done by using the `mkdir` and `touch` command. 

Here is the following command we used: 

```bash
$ mkdir -p soal_1 soal_2/scripts soal_3 soal_4 && touch ./soal_1/poppo_siroyo.sh ./soal_2/login.sh ./soal_2/register.sh ./soal_2/scripts/core_monitor.sh ./soal_2/scripts/frag_monitor.sh ./soal_2/scripts/manager.sh ./soal_2/terminal.sh ./soal_3/dsotm.sh ./soal_4/pokemon_analysis.sh

```

## Local Repo Setup

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

