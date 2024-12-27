int main(){
    int a[5];

    int i;
    i=0;
    while(i<5){
        a[i]=i;
        i=i+1;
    }

    int j;
    i=0;
    j=0;

    int a[5][5];
    while(i<5){
        j=0;
        while(j<5){
            while(j<5){
                a[i][j]=i+j;
                j=j+1;
        }
        i=i+1;
    }
}