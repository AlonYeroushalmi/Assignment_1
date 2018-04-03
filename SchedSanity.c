#include "types.h"
#include "user.h"
#define PROCESSES_NUM 12
#define CALCULATION_MEDIUM_LOOP 100000
#define CALCULATION_VERY_LARGE_LOOP 1000000
#define IO_MEDIUM_LOOP 1000
#define IO_VERY_LARGE_LOOP 10000

//2 running modes
#define FOUR_SUBTYPES_PROCESSES_MODE 1
#define DETAILED_MODE 2
#define SCHED_SANITY_MODE DETAILED_MODE

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
	int pid;
	if(SCHED_SANITY_MODE == FOUR_SUBTYPES_PROCESSES_MODE)
	{
		#ifdef CFSD
		int cfsd = 1;
		#else
		int cfsd = 0;
		#endif	

		int pids[PROCESSES_NUM];

		for(int i=0; i< PROCESSES_NUM; i++){
			
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

	printf(1, "\n\nResults represent as average:\n-----------------------------\n\n");
	printf(1,"Calculation Medium: Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[0]/PROCESSES_NUM,sum_rtime[0]/PROCESSES_NUM,sum_iotime[0]/PROCESSES_NUM);
	printf(1,"Calculation Very Large: Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[1]/PROCESSES_NUM,sum_rtime[1]/PROCESSES_NUM,sum_iotime[1]/PROCESSES_NUM);
	printf(1,"Calculation + IO Medium: Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[2]/PROCESSES_NUM,sum_rtime[2]/PROCESSES_NUM,sum_iotime[2]/PROCESSES_NUM);
	printf(1,"Calculation + IO Very Large: Wait time: %d,  Run time: %d, IO Time: %d\n\n",sum_wtime[3]/PROCESSES_NUM,sum_rtime[3]/PROCESSES_NUM,sum_iotime[3]/PROCESSES_NUM);

}

else{

    int sum_iotime=0;
    int sum_wtime=0;
    int sum_rtime=0;

    int pids[10]={0,0,0,0,0,0,0,0,0,0};
    int rtime[10][1]={{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}};
    int iotime[10][1]={{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}};
    int wtime[10][1]={{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}};

	int i,j;

	for (i=0;i<10;i++){
	   if((pid = fork()) == 0) {
	   	//son process
	      set_priority(1); // choose desired priority
	      calculation_very_large_loop(); //choose what calculation type we want here
	      exit();
	   }
	   else
	      pids[i]=pid; //update the son process pid in pids
	}
	     
    for(j = 0; j < 10; j++){
        int pid=pids[j];
        printf(2,"pid = %d\n",pid);
        wait2(pid,wtime[j],rtime[j],iotime[j]);
        printf(2,"iotime = %d\n", iotime[j][0]);
        printf(2,"rtime = %d\n",rtime[j][0]);
        printf(2,"wtime = %d\n", wtime[j][0]); 
     	sum_iotime += iotime[j][0];
     	sum_rtime  += rtime[j][0];
     	sum_wtime  += wtime[j][0];
 		printf(1,"\n");
    }
    printf(1, "\n\nResults represent as average:\n-----------------------------\n\n");
    printf(2,"iotime = %d\n", sum_iotime/10);
	printf(2,"rtime = %d\n",sum_rtime/10);
    printf(2,"wtime = %d\n", sum_wtime/10);
	}
exit();
}