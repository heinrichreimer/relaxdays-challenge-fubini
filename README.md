# 🧑‍💻 relaxdays-challenge-fubini

Calculate a sequence of fubini numbers.

This project was created in the Relaxdays Code Challenge Vol. 1.
See the [hackathon homepage](https://sites.google.com/relaxdays.de/hackathon-relaxdays/startseite) for more information.
My participant ID in the challenge was: `CC-VOL1-54`

## Usage

First you need to clone this repository:

```shell script
git clone https://github.com/heinrichreimer/relaxdays-challenge-fubini.git
cd relaxdays-challenge-fubini/
```

### Docker container

1. Install [Docker](https://docs.docker.com/get-docker/).
1. Build a Docker container with this project:

    ```shell script
    docker build -t relaxdays-challenge-fubini .
    ```

1. Calculate first 10 fubini numbers:

    ```shell script
    docker run -it relaxdays-challenge-fubini 10
    ```

### Local machine

1. Install [Julia](https://julialang.org/downloads/).
1. Install dependencies.

    ```shell script
    julia --eval 'using Pkg; Pkg.add("Combinatorics")'
    ```

1. Calculate first 10 fubini numbers:

    ```shell script
    julia fubini.jl 10
    ```

## License

This repository is licensed under the [MIT License](LICENSE).
