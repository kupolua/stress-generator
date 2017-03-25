#Usage examples

expects HOST and PORT environment variables

Benchmark has default text file with 25091 words.

get benchmark:
```
git clone https://github.com/kupolua/stress-generator.git 
cd stress-generator
```
benchmark test run command:

`docker run --rm -i -e HOST=${HOST} -e PORT=${PORT} kupolua/stress-generator`

Adding a data volume for using custom benchmark text file. This folder should be contains text file named `sampletext`.

example command:

docker run --rm -i -v ${PWD}/input/:/opt/stress/input -e HOST=${HOST} -e PORT=${PORT} kupolua/stress-generator 
