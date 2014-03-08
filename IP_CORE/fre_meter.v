//file : freq meter ------------------------count one cycle signal input freq
//file : output freq count------------------f = Fclk/N------------saved in N register
//Auther : S.C.
module fre_meter(clk,rst_n,freq_in,N,M);//N :detect freq;M clk devide

input clk;
input rst_n;
input freq_in;
output [21:0] N;//freq counter
output [12:0] M;//freq_div_num

reg div_clk;
reg [21:0] N;
reg [21:0] pre_n;
reg pre_div_clk;
reg [1:0] wait_cnt;
reg [12:0] M;
reg [21:0] M_r;

// gate signal div_clk
always@(posedge freq_in or negedge rst_n)
begin
   if(!rst_n)
   begin
       div_clk <= 1'b0;
   end
   else
   begin
       div_clk <= ~div_clk;
   end
end

always@(posedge clk or negedge rst_n )
begin
    if(!rst_n)  
    begin
        pre_n <= 22'b0;
        pre_div_clk <= 1'b0;
    end
    else
    begin
       pre_div_clk <= div_clk;
       if(div_clk)
       pre_n <= pre_n +22'b1;
       else
       begin
       pre_n <= 22'b0;
       end
    end
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        N <= 22'b0;
    end
    else
    begin
       if({pre_div_clk,div_clk}==2'b10)
       N <= pre_n;
       else
       N <= N;
       
    end
end

//shift block
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        M_r <= 22'b0;
        wait_cnt <= 2'b0;
        M <= 13'b0;
    end
    else
    begin
        M_r <= N;
        wait_cnt <= wait_cnt +2'b1;
        if(wait_cnt==3)
        begin
            M[11:0] <= M_r[21:10];
        end
        else
        begin
            M <= M;
            M_r <= M_r;
        end
    end
end
endmodule    
   
   
