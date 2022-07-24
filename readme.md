# Web Ape

Proof of concept shell script for brute-forcing unreleased images for Apex Legends. 

# Disclaimer

Do not use this script on services you do not own or are not permitted to test. The default configuration is designed to target the sub-domain `media.contentapi.ea.com`  

# Designed usage

Set season date

```bash
./ape.sh --date <month> <year>
```

Run script

```bash
./ape.sh <season> <weapon> <legend> <map>
```

Bruteforce season

```bash
./ape.sh --season <wordlist>
```

Display help message
```bash
./ape.sh --help
```



## Prerequisites
- [Gobuster](https://github.com/OJ/gobuster)



## License
[MIT](https://choosealicense.com/licenses/mit/)