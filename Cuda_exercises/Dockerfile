FROM nvidia/cuda:9.0-devel AS builder
RUN apt-get update && apt-get install -y cmake libopencv-dev
WORKDIR /src
COPY . .
RUN mkdir build && cd build && cmake .. && make
FROM nvidia/cuda:9.0-runtime
RUN apt-get update && apt-get install -y libopencv-core2.4v5 libopencv-highgui2.4v5
WORKDIR /data
VOLUME /data
COPY --from=builder /src/build/rgb2gray /app/rgb2gray
ENTRYPOINT ["/app/rgb2gray"]

