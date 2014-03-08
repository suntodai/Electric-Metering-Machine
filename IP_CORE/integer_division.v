module integer_division(clk,rst_n,M,ad_clk);
//port declearation
input clk;
input rst_n;
input [12:0] M;
output ad_clk;

reg ad_clk;
reg flag;//even or odd flag , if even flag = 0
reg  [11:0] count;
reg  [11:0] div;
wire [12:0] m;
assign m = M;

//reg [1:0] cs;
//reg [1:0] ns;
reg [1:0] state;
parameter s0 = 2'b00;//div
parameter s1 = 2'b10;//div-1

//judge even or odd 
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
       flag <= 1'b0;
    end
    else  
    begin
       flag <= m[0];
    end
end

//main block
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        ad_clk <= 1'b0;
        count <= 12'b0;
        div <= 12'b0;
       // cs <= s0;
        state <= s0;
    end
    else
    begin
      //  cs <= ns;
       // div <= (M>>1);
          div <= M[12:1];
        if(!flag)//even division
        begin
            if(count==div-1)
            begin
                ad_clk <= ~ad_clk;
                count <= 12'b0;
            end
            else
            begin
                count <= count +12'b1;
                ad_clk <= ad_clk;
            end
        end
        else//odd division
        begin
            case(state)
            s0:
               begin
                  if(count==div)
                  begin
                      state <= s1;
                      count <= 12'b0;
                      ad_clk <= ~ad_clk;
                  end
                  else
                  begin
                      state <= s0;
                      count <= count + 12'b1;
                      ad_clk <= ad_clk;
                  end
               end
            s1:
               begin
                   if(count==div-1)
                   begin
                       state <= s0;
                       count <= 12'b0;
                       ad_clk <= ~ad_clk;
                   end
                   else
                   begin
                       state <= s1;
                       count <= count + 12'b1;
                       ad_clk <= ad_clk;
                   end
               end
            default:
                state <= s0;
            endcase
        end
    end
end

endmodule
    
                
            

        
        

     