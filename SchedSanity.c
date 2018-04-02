#include "types.h"
#include "user.h"
#define PROCESSES_NUM 10
#define CALCULATION_MEDIUM_LOOP 1000000
#define CALCULATION_VERY_LARGE_LOOP 200000000
#define IO_MEDIUM_LOOP 1000
#define IO_VERY_LARGE_LOOP 20000

void calculation_medium_loop(){
	int sum = 0;
	for(int i=0; i<CALCULATION_MEDIUM_LOOP; i++)
		sum++;
	
}

void calculation_very_large_loop(){
	int sum = 0;
	for(int i=0;i<CALCULATION_VERY_LARGE_LOOP;i++)
		sum++;
	
}

void io_medium_loop(){
	for(int i=0; i<IO_MEDIUM_LOOP; i++){
		printf(1, "Print Something\n");
	}
}

void io_very_large_loop(){
	for(int i=0; i<IO_VERY_LARGE_LOOP; i++){
		printf(1, "Print Something\n");
	}
}



int main(int argc, char *argv[])
{


#ifdef CFSD
	int cfsd = 1;
#else
	int cfsd = 0;
#endif	

	int pids[PROCESSES_NUM];

	for(int i=0; i< PROCESSES_NUM; i++){
		int pid;
	    pid = fork();
		if(pid == 0){
			if(cfsd) set_priority(i%3 + 1);
			if(i%4 == 0)
				calculation_medium_loop(); //Calculation only - These processes will perform asimple calculation within a medium sized loop
			if(i%4 == 1)
				calculation_very_large_loop(); //Calculation only – These processes will perform simple calculation within a very large loop
			if(i%4 == 2)
				io_medium_loop();// Calculation + IO – These processes will perform printing to screen within a medium sized loop
			if(i%4 == 3)
				io_very_large_loop(); // Calculation + IO – These processes will perform printing to screen within a very large loop
				
			exit();	
		}
		else 
			pids[i] = pid;
	
	}


	int sum_wtime[4];
	int sum_rtime[4];
	int sum_iotime[4];
	int wtime;
	int rtime;
	int iotime;

	for(int i=0; i< PROCESSES_NUM; i++){
			wait2(pids[i],&wtime,&rtime,&iotime);
			sum_wtime[i%4] += wtime;
			sum_rtime[i%4] += rtime;
			sum_iotime[i%4] += iotime;
	   
	}
	

	printf(1,"Calculation Medium:  			Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[0]/PROCESSES_NUM,sum_rtime[0]/PROCESSES_NUM,sum_iotime[0]/PROCESSES_NUM);
	printf(1,"Calculation Very Large:  		Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[1]/PROCESSES_NUM,sum_rtime[1]/PROCESSES_NUM,sum_iotime[1]/PROCESSES_NUM);
	printf(1,"Calculation + IO Medium: 		Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[2]/PROCESSES_NUM,sum_rtime[2]/PROCESSES_NUM,sum_iotime[2]/PROCESSES_NUM);
	printf(1,"Calculation + IO Very Large:  Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[3]/PROCESSES_NUM,sum_rtime[3]/PROCESSES_NUM,sum_iotime[3]/PROCESSES_NUM);

	exit();
}