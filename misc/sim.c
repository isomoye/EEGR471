int main(){

    int cycle = 0;

    while(1){
        parse(a,b,c,d);
        e = AND(a,b);
        f = NOR(b,c);
        g = OR(e,f);
        h = NAND(d,f);
        print(cycle,g,h);
        cycle++;
    }
}