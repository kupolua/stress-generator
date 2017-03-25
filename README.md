#Usage examples

expects HOST and PORT environment variables

Benchmark has default text file with 25091 words.
benchmark test run command:
`docker run --rm -i -e HOST=${HOST} -e PORT=${PORT} stress-generator`

Adding a data volume for using other benchmark text file. This folder should be contains text file named `sampletext`.
example command:
docker run --rm -i -v ~/stress-generator/input/:/opt/stress/input -e HOST=${HOST} -e PORT=${PORT} stress-generator 
