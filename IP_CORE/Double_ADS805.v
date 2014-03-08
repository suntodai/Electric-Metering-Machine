module Double_ADS805(
//avalon side
clk,
rst_n,
write,
read,
readdata,
writedata,
address,
irq,
//AD side
ad_clk,
i_input,
u_input
);//*****************************************************************
//port declearation
//avalon side
input clk;
input rst_n;
input read;
input write;
input [31:0] writedata;
output [31:0] readdata;
input [1:0] address;
output irq;
//Ad side
input ad_clk;
input [11:0] i_input;
input [11:0] u_input;

//internal wires and registers
reg [31:0] read_data_r;
reg irq_r;
reg clear_irq_r;//write 1 to this register to clear irq
reg start_r;
reg [11:0] num_cnt;//number written to fifo//******************************modify
wire [15:0] u_data;
wire [15:0] i_data;
wire [31:0] out_data_net;//output 32b data
wire start;
reg  [31:0] out_data_r;
//assign readdata = read_data_r;
reg [31:0] readdata;
assign irq = irq_r;
assign start = start_r;
assign out_data_net = {u_data,i_data};//High 16'b voltage Low 16b current

//wire fifo_rd_clk;
//assign fifo_rd_clk = ~clk;
//**********************************************************************
//fifo
 fifo fifo_u(
	.aclr(!rst_n),
	.data({4'b0,u_input}),
	.rdclk(clk),
	.rdreq(read),//read signal control the read action  ;given by avalon bus
	.wrclk(ad_clk),
	.wrreq(start),//if start = 1'b1 then write to fifo
	.q(u_data));
	
fifo fifo_i(
	.aclr(!rst_n),
	.data({4'b0,i_input}),
	.rdclk(clk),
	.rdreq(read),
	.wrclk(ad_clk),
	.wrreq(start),
	.q(i_data));
//****************************************************************************
//irq signal generate block	 count should use Ad clk
always@(posedge ad_clk or negedge rst_n)
begin
   if(!rst_n)
   begin
      num_cnt <= 11'b0;
      irq_r <= 1'b0;
   end
   else
   begin
       if(start_r)
       begin
           if(num_cnt==1024)
           begin
               irq_r <=  1'b1;
               num_cnt <= 11'b0;
           end
           else
           begin           
               num_cnt <= num_cnt + 11'b1;
               if(clear_irq_r)
               begin
                   irq_r <= 1'b0;
               end
               else
               begin
                   irq_r <= irq_r;
               end    
           end
       end
       else
       begin
           num_cnt <= num_cnt ;
       end
    end
end
//out_data_r register data generate block  ; generate readdata register to sycronize with the clk
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin                                                                                                                                           
        out_data_r <= 32'b0;
        readdata <= 32'b0;
    end
    else
    begin
        out_data_r <= out_data_net;
        readdata <= read_data_r;
    end
end
//write action
always@(posedge clk or negedge rst_n)
begin
   if(!rst_n)
   begin
      start_r <= 1'b0;
      clear_irq_r   <= 1'b0;
   end
   else
   begin
      if(write)
      begin
         case(address)
         2'b01:begin
                   start_r <= writedata[0];
               end
         2'b10:begin
                   clear_irq_r   <= writedata[0];
               end
         default:begin
                    start_r <= start_r;
                    irq_r   <= irq_r;
                 end
         endcase
      end
      else
      begin
         start_r <= start_r;
         irq_r   <= irq_r;
      end
   end
end

//read action
always@(address or start_r or irq_r or out_data_r or read)
begin
    if(read)
    begin
        case(address)
        2'b00:begin
                 read_data_r <= out_data_r;
              end
        2'b01:begin
                 read_data_r <= {31'b0,start_r};
              end
        2'b10:begin
                 read_data_r <= {31'b0,irq_r};
              end
        default:begin
                 read_data_r <= 31'b0;//*************************important if not generate latch
                end
        endcase
    end
    else
    begin
        read_data_r <= 31'b0;
    end
end

endmodule
















