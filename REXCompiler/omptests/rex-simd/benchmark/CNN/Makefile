default:
	/opt/llvm/llvm-14.x-install/bin/clang++ -I/usr/include/opencv4 -DOPENCV -std=c++11 -Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -fPIC -fopenmp -g -O0 -Ofast -lm -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs -L/opt/llvm/llvm-14.x-install/lib cnn_in_one_page_test_cases_cpu.cpp conv-omp-cpu.cpp connect-omp-cpu.cpp util.cpp -o main-omp-cpu

run-omp-cpu:
	./main-omp-cpu 2000 50 20 50 1

clean:
	rm -rf main-* main.* 
