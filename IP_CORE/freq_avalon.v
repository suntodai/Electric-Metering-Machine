module freq_avalon(
//avalon signals
clk,
rst_n,
address,
write,
writedata,
read,
readdata,
//AD side
freq_in,
//N,
//M,
ad_clk
);

//ports
//avalon side
input clk;
input rst_n;
input [1:0] address;
input write;
input [31:0] writedata;
input read;
output [31:0] readdata;

//ad side
input freq_in;
//output [21:0] N;
//output [12:0] M;
output ad_clk;
reg [21:0] N;//address 0 
reg [12:0] M;//address 1
reg start_detect_r;

integer_division d0(
.rst_n(rst_n),
.clk(clk),
.ad_clk(ad_clk),
.M(m)
);

fre_meter f0(
.clk(clk),
.rst_n(rst_n),
.freq_in(freq_in),
.N(n),
.M(m));

wire [21:0] n;
wire [12:0] m;
reg [31:0] read_data_r;
assign readdata = read_data_r;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        N <= 22'b0;
        M <= 13'b0;
    end
    else
    begin
        if(start_detect_r)
        begin
            N <= n;
            M <= m;//_______________________written wrong M <= m
        end
        else
        begin
            N <= 22'b0;
            M <= 13'b0;
        end
    end
end

//read action
always@(read_data_r or address or N or M or read or start_detect_r)
begin
    if(read)
    begin
        case(address)
        2'b00:
            begin
                read_data_r <= {10'b0,N};
            end
        2'b01:
            begin
                read_data_r <= {19'b0,M};
            end
        2'b10:
            begin
                read_data_r <= {31'b0,start_detect_r};
            end
        default:
            begin
                read_data_r <= 32'b0;
            end
        endcase
    end
    else
    begin
        read_data_r <= 32'b0;
    end
end


//write action
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        start_detect_r <= 1'b0;
    end
    else
    begin
        if(write)
        begin
            case(address)
            2'b10:
                 begin
                     start_detect_r <= writedata[0];
                 end
            default:
                 begin
                     start_detect_r <= start_detect_r;
                 end
             endcase
        end
        else
        begin
            start_detect_r <= start_detect_r;
        end
    end
end

endmodule
