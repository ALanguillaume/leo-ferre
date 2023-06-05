# When Itunes' database fails you, tesseract got your back


## Re-run the data pipeline

You only need to have docker installed on your machine and the original .m4a
files in `music/raw/`

Make sure to clone the repo on your computer and then `cd` into it

```
git clone https://github.com/ALanguillaume/leo-ferre.git
cd leo-ferre
```

Build the docker image

``` bash
docker build . -t leo-ferre
```

You can then run a container from the dedicated image

``` bash
docker run -it leo-ferre
```

Rerun the `make` pipeline 

```
# Remove output .txt and .m4a files
make clean
# Run the whole pipeline
make all
```
