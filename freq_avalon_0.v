//Legal Notice: (C)2007 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module freq_avalon_0 (
                       // inputs:
                        address,
                        clk,
                        freq_in,
                        read,
                        rst_n,
                        write,
                        writedata,

                       // outputs:
                        ad_clk,
                        readdata
                     )
;

  output           ad_clk;
  output  [ 31: 0] readdata;
  input   [  1: 0] address;
  input            clk;
  input            freq_in;
  input            read;
  input            rst_n;
  input            write;
  input   [ 31: 0] writedata;

  wire             ad_clk;
  wire    [ 31: 0] readdata;
  freq_avalon the_freq_avalon
    (
      .ad_clk    (ad_clk),
      .address   (address),
      .clk       (clk),
      .freq_in   (freq_in),
      .read      (read),
      .readdata  (readdata),
      .rst_n     (rst_n),
      .write     (write),
      .writedata (writedata)
    );


endmodule

