//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


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

module BUTTON_PIO_s1_arbitrator (
                                  // inputs:
                                   BUTTON_PIO_s1_readdata,
                                   clk,
                                   nios_fast_data_master_address_to_slave,
                                   nios_fast_data_master_latency_counter,
                                   nios_fast_data_master_read,
                                   nios_fast_data_master_write,
                                   reset_n,

                                  // outputs:
                                   BUTTON_PIO_s1_address,
                                   BUTTON_PIO_s1_readdata_from_sa,
                                   BUTTON_PIO_s1_reset_n,
                                   d1_BUTTON_PIO_s1_end_xfer,
                                   nios_fast_data_master_granted_BUTTON_PIO_s1,
                                   nios_fast_data_master_qualified_request_BUTTON_PIO_s1,
                                   nios_fast_data_master_read_data_valid_BUTTON_PIO_s1,
                                   nios_fast_data_master_requests_BUTTON_PIO_s1
                                )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [  1: 0] BUTTON_PIO_s1_address;
  output  [  4: 0] BUTTON_PIO_s1_readdata_from_sa;
  output           BUTTON_PIO_s1_reset_n;
  output           d1_BUTTON_PIO_s1_end_xfer;
  output           nios_fast_data_master_granted_BUTTON_PIO_s1;
  output           nios_fast_data_master_qualified_request_BUTTON_PIO_s1;
  output           nios_fast_data_master_read_data_valid_BUTTON_PIO_s1;
  output           nios_fast_data_master_requests_BUTTON_PIO_s1;
  input   [  4: 0] BUTTON_PIO_s1_readdata;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input            reset_n;

  wire    [  1: 0] BUTTON_PIO_s1_address;
  wire             BUTTON_PIO_s1_allgrants;
  wire             BUTTON_PIO_s1_allow_new_arb_cycle;
  wire             BUTTON_PIO_s1_any_bursting_master_saved_grant;
  wire             BUTTON_PIO_s1_any_continuerequest;
  wire             BUTTON_PIO_s1_arb_counter_enable;
  reg     [  2: 0] BUTTON_PIO_s1_arb_share_counter;
  wire    [  2: 0] BUTTON_PIO_s1_arb_share_counter_next_value;
  wire    [  2: 0] BUTTON_PIO_s1_arb_share_set_values;
  wire             BUTTON_PIO_s1_beginbursttransfer_internal;
  wire             BUTTON_PIO_s1_begins_xfer;
  wire             BUTTON_PIO_s1_end_xfer;
  wire             BUTTON_PIO_s1_firsttransfer;
  wire             BUTTON_PIO_s1_grant_vector;
  wire             BUTTON_PIO_s1_in_a_read_cycle;
  wire             BUTTON_PIO_s1_in_a_write_cycle;
  wire             BUTTON_PIO_s1_master_qreq_vector;
  wire             BUTTON_PIO_s1_non_bursting_master_requests;
  wire    [  4: 0] BUTTON_PIO_s1_readdata_from_sa;
  reg              BUTTON_PIO_s1_reg_firsttransfer;
  wire             BUTTON_PIO_s1_reset_n;
  reg              BUTTON_PIO_s1_slavearbiterlockenable;
  wire             BUTTON_PIO_s1_slavearbiterlockenable2;
  wire             BUTTON_PIO_s1_unreg_firsttransfer;
  wire             BUTTON_PIO_s1_waits_for_read;
  wire             BUTTON_PIO_s1_waits_for_write;
  reg              d1_BUTTON_PIO_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_BUTTON_PIO_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_BUTTON_PIO_s1;
  wire             nios_fast_data_master_qualified_request_BUTTON_PIO_s1;
  wire             nios_fast_data_master_read_data_valid_BUTTON_PIO_s1;
  wire             nios_fast_data_master_requests_BUTTON_PIO_s1;
  wire             nios_fast_data_master_saved_grant_BUTTON_PIO_s1;
  wire    [ 23: 0] shifted_address_to_BUTTON_PIO_s1_from_nios_fast_data_master;
  wire             wait_for_BUTTON_PIO_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~BUTTON_PIO_s1_end_xfer;
    end


  assign BUTTON_PIO_s1_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_BUTTON_PIO_s1));
  //assign BUTTON_PIO_s1_readdata_from_sa = BUTTON_PIO_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign BUTTON_PIO_s1_readdata_from_sa = BUTTON_PIO_s1_readdata;

  assign nios_fast_data_master_requests_BUTTON_PIO_s1 = (({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h902030) & (nios_fast_data_master_read | nios_fast_data_master_write)) & nios_fast_data_master_read;
  //BUTTON_PIO_s1_arb_share_counter set values, which is an e_mux
  assign BUTTON_PIO_s1_arb_share_set_values = 1;

  //BUTTON_PIO_s1_non_bursting_master_requests mux, which is an e_mux
  assign BUTTON_PIO_s1_non_bursting_master_requests = nios_fast_data_master_requests_BUTTON_PIO_s1;

  //BUTTON_PIO_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign BUTTON_PIO_s1_any_bursting_master_saved_grant = 0;

  //BUTTON_PIO_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign BUTTON_PIO_s1_arb_share_counter_next_value = BUTTON_PIO_s1_firsttransfer ? (BUTTON_PIO_s1_arb_share_set_values - 1) : |BUTTON_PIO_s1_arb_share_counter ? (BUTTON_PIO_s1_arb_share_counter - 1) : 0;

  //BUTTON_PIO_s1_allgrants all slave grants, which is an e_mux
  assign BUTTON_PIO_s1_allgrants = |BUTTON_PIO_s1_grant_vector;

  //BUTTON_PIO_s1_end_xfer assignment, which is an e_assign
  assign BUTTON_PIO_s1_end_xfer = ~(BUTTON_PIO_s1_waits_for_read | BUTTON_PIO_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_BUTTON_PIO_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_BUTTON_PIO_s1 = BUTTON_PIO_s1_end_xfer & (~BUTTON_PIO_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //BUTTON_PIO_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign BUTTON_PIO_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_BUTTON_PIO_s1 & BUTTON_PIO_s1_allgrants) | (end_xfer_arb_share_counter_term_BUTTON_PIO_s1 & ~BUTTON_PIO_s1_non_bursting_master_requests);

  //BUTTON_PIO_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          BUTTON_PIO_s1_arb_share_counter <= 0;
      else if (BUTTON_PIO_s1_arb_counter_enable)
          BUTTON_PIO_s1_arb_share_counter <= BUTTON_PIO_s1_arb_share_counter_next_value;
    end


  //BUTTON_PIO_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          BUTTON_PIO_s1_slavearbiterlockenable <= 0;
      else if ((|BUTTON_PIO_s1_master_qreq_vector & end_xfer_arb_share_counter_term_BUTTON_PIO_s1) | (end_xfer_arb_share_counter_term_BUTTON_PIO_s1 & ~BUTTON_PIO_s1_non_bursting_master_requests))
          BUTTON_PIO_s1_slavearbiterlockenable <= |BUTTON_PIO_s1_arb_share_counter_next_value;
    end


  //nios_fast/data_master BUTTON_PIO/s1 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = BUTTON_PIO_s1_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //BUTTON_PIO_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign BUTTON_PIO_s1_slavearbiterlockenable2 = |BUTTON_PIO_s1_arb_share_counter_next_value;

  //nios_fast/data_master BUTTON_PIO/s1 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = BUTTON_PIO_s1_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //BUTTON_PIO_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign BUTTON_PIO_s1_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_BUTTON_PIO_s1 = nios_fast_data_master_requests_BUTTON_PIO_s1 & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))));
  //local readdatavalid nios_fast_data_master_read_data_valid_BUTTON_PIO_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_BUTTON_PIO_s1 = nios_fast_data_master_granted_BUTTON_PIO_s1 & nios_fast_data_master_read & ~BUTTON_PIO_s1_waits_for_read;

  //master is always granted when requested
  assign nios_fast_data_master_granted_BUTTON_PIO_s1 = nios_fast_data_master_qualified_request_BUTTON_PIO_s1;

  //nios_fast/data_master saved-grant BUTTON_PIO/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_BUTTON_PIO_s1 = nios_fast_data_master_requests_BUTTON_PIO_s1;

  //allow new arb cycle for BUTTON_PIO/s1, which is an e_assign
  assign BUTTON_PIO_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign BUTTON_PIO_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign BUTTON_PIO_s1_master_qreq_vector = 1;

  //BUTTON_PIO_s1_reset_n assignment, which is an e_assign
  assign BUTTON_PIO_s1_reset_n = reset_n;

  //BUTTON_PIO_s1_firsttransfer first transaction, which is an e_assign
  assign BUTTON_PIO_s1_firsttransfer = BUTTON_PIO_s1_begins_xfer ? BUTTON_PIO_s1_unreg_firsttransfer : BUTTON_PIO_s1_reg_firsttransfer;

  //BUTTON_PIO_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign BUTTON_PIO_s1_unreg_firsttransfer = ~(BUTTON_PIO_s1_slavearbiterlockenable & BUTTON_PIO_s1_any_continuerequest);

  //BUTTON_PIO_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          BUTTON_PIO_s1_reg_firsttransfer <= 1'b1;
      else if (BUTTON_PIO_s1_begins_xfer)
          BUTTON_PIO_s1_reg_firsttransfer <= BUTTON_PIO_s1_unreg_firsttransfer;
    end


  //BUTTON_PIO_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign BUTTON_PIO_s1_beginbursttransfer_internal = BUTTON_PIO_s1_begins_xfer;

  assign shifted_address_to_BUTTON_PIO_s1_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //BUTTON_PIO_s1_address mux, which is an e_mux
  assign BUTTON_PIO_s1_address = shifted_address_to_BUTTON_PIO_s1_from_nios_fast_data_master >> 2;

  //d1_BUTTON_PIO_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_BUTTON_PIO_s1_end_xfer <= 1;
      else if (1)
          d1_BUTTON_PIO_s1_end_xfer <= BUTTON_PIO_s1_end_xfer;
    end


  //BUTTON_PIO_s1_waits_for_read in a cycle, which is an e_mux
  assign BUTTON_PIO_s1_waits_for_read = BUTTON_PIO_s1_in_a_read_cycle & BUTTON_PIO_s1_begins_xfer;

  //BUTTON_PIO_s1_in_a_read_cycle assignment, which is an e_assign
  assign BUTTON_PIO_s1_in_a_read_cycle = nios_fast_data_master_granted_BUTTON_PIO_s1 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = BUTTON_PIO_s1_in_a_read_cycle;

  //BUTTON_PIO_s1_waits_for_write in a cycle, which is an e_mux
  assign BUTTON_PIO_s1_waits_for_write = BUTTON_PIO_s1_in_a_write_cycle & 0;

  //BUTTON_PIO_s1_in_a_write_cycle assignment, which is an e_assign
  assign BUTTON_PIO_s1_in_a_write_cycle = nios_fast_data_master_granted_BUTTON_PIO_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = BUTTON_PIO_s1_in_a_write_cycle;

  assign wait_for_BUTTON_PIO_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //BUTTON_PIO/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Double_ADS805_0_avalon_slave_0_arbitrator (
                                                   // inputs:
                                                    Double_ADS805_0_avalon_slave_0_irq,
                                                    Double_ADS805_0_avalon_slave_0_readdata,
                                                    clk,
                                                    nios_fast_data_master_address_to_slave,
                                                    nios_fast_data_master_latency_counter,
                                                    nios_fast_data_master_read,
                                                    nios_fast_data_master_write,
                                                    nios_fast_data_master_writedata,
                                                    nios_fast_instruction_master_address_to_slave,
                                                    nios_fast_instruction_master_latency_counter,
                                                    nios_fast_instruction_master_read,
                                                    reset_n,

                                                   // outputs:
                                                    Double_ADS805_0_avalon_slave_0_address,
                                                    Double_ADS805_0_avalon_slave_0_irq_from_sa,
                                                    Double_ADS805_0_avalon_slave_0_read,
                                                    Double_ADS805_0_avalon_slave_0_readdata_from_sa,
                                                    Double_ADS805_0_avalon_slave_0_reset_n,
                                                    Double_ADS805_0_avalon_slave_0_write,
                                                    Double_ADS805_0_avalon_slave_0_writedata,
                                                    d1_Double_ADS805_0_avalon_slave_0_end_xfer,
                                                    nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0,
                                                    nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0,
                                                    nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0,
                                                    nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0,
                                                    nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0,
                                                    nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0,
                                                    nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0,
                                                    nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0
                                                 )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [  1: 0] Double_ADS805_0_avalon_slave_0_address;
  output           Double_ADS805_0_avalon_slave_0_irq_from_sa;
  output           Double_ADS805_0_avalon_slave_0_read;
  output  [ 31: 0] Double_ADS805_0_avalon_slave_0_readdata_from_sa;
  output           Double_ADS805_0_avalon_slave_0_reset_n;
  output           Double_ADS805_0_avalon_slave_0_write;
  output  [ 31: 0] Double_ADS805_0_avalon_slave_0_writedata;
  output           d1_Double_ADS805_0_avalon_slave_0_end_xfer;
  output           nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0;
  output           nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  output           nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  output           nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0;
  output           nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0;
  output           nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  output           nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  output           nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0;
  input            Double_ADS805_0_avalon_slave_0_irq;
  input   [ 31: 0] Double_ADS805_0_avalon_slave_0_readdata;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input   [ 23: 0] nios_fast_instruction_master_address_to_slave;
  input            nios_fast_instruction_master_latency_counter;
  input            nios_fast_instruction_master_read;
  input            reset_n;

  wire    [  1: 0] Double_ADS805_0_avalon_slave_0_address;
  wire             Double_ADS805_0_avalon_slave_0_allgrants;
  wire             Double_ADS805_0_avalon_slave_0_allow_new_arb_cycle;
  wire             Double_ADS805_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             Double_ADS805_0_avalon_slave_0_any_continuerequest;
  reg     [  1: 0] Double_ADS805_0_avalon_slave_0_arb_addend;
  wire             Double_ADS805_0_avalon_slave_0_arb_counter_enable;
  reg     [  2: 0] Double_ADS805_0_avalon_slave_0_arb_share_counter;
  wire    [  2: 0] Double_ADS805_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  2: 0] Double_ADS805_0_avalon_slave_0_arb_share_set_values;
  wire    [  1: 0] Double_ADS805_0_avalon_slave_0_arb_winner;
  wire             Double_ADS805_0_avalon_slave_0_arbitration_holdoff_internal;
  wire             Double_ADS805_0_avalon_slave_0_beginbursttransfer_internal;
  wire             Double_ADS805_0_avalon_slave_0_begins_xfer;
  wire    [  3: 0] Double_ADS805_0_avalon_slave_0_chosen_master_double_vector;
  wire    [  1: 0] Double_ADS805_0_avalon_slave_0_chosen_master_rot_left;
  wire             Double_ADS805_0_avalon_slave_0_end_xfer;
  wire             Double_ADS805_0_avalon_slave_0_firsttransfer;
  wire    [  1: 0] Double_ADS805_0_avalon_slave_0_grant_vector;
  wire             Double_ADS805_0_avalon_slave_0_in_a_read_cycle;
  wire             Double_ADS805_0_avalon_slave_0_in_a_write_cycle;
  wire             Double_ADS805_0_avalon_slave_0_irq_from_sa;
  wire    [  1: 0] Double_ADS805_0_avalon_slave_0_master_qreq_vector;
  wire             Double_ADS805_0_avalon_slave_0_non_bursting_master_requests;
  wire             Double_ADS805_0_avalon_slave_0_read;
  wire    [ 31: 0] Double_ADS805_0_avalon_slave_0_readdata_from_sa;
  reg              Double_ADS805_0_avalon_slave_0_reg_firsttransfer;
  wire             Double_ADS805_0_avalon_slave_0_reset_n;
  reg     [  1: 0] Double_ADS805_0_avalon_slave_0_saved_chosen_master_vector;
  reg              Double_ADS805_0_avalon_slave_0_slavearbiterlockenable;
  wire             Double_ADS805_0_avalon_slave_0_slavearbiterlockenable2;
  wire             Double_ADS805_0_avalon_slave_0_unreg_firsttransfer;
  wire             Double_ADS805_0_avalon_slave_0_waits_for_read;
  wire             Double_ADS805_0_avalon_slave_0_waits_for_write;
  wire             Double_ADS805_0_avalon_slave_0_write;
  wire    [ 31: 0] Double_ADS805_0_avalon_slave_0_writedata;
  reg              d1_Double_ADS805_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Double_ADS805_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_nios_fast_data_master_granted_slave_Double_ADS805_0_avalon_slave_0;
  reg              last_cycle_nios_fast_instruction_master_granted_slave_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_saved_grant_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_arbiterlock;
  wire             nios_fast_instruction_master_arbiterlock2;
  wire             nios_fast_instruction_master_continuerequest;
  wire             nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_saved_grant_Double_ADS805_0_avalon_slave_0;
  wire    [ 23: 0] shifted_address_to_Double_ADS805_0_avalon_slave_0_from_nios_fast_data_master;
  wire    [ 23: 0] shifted_address_to_Double_ADS805_0_avalon_slave_0_from_nios_fast_instruction_master;
  wire             wait_for_Double_ADS805_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~Double_ADS805_0_avalon_slave_0_end_xfer;
    end


  assign Double_ADS805_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0 | nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0));
  //assign Double_ADS805_0_avalon_slave_0_readdata_from_sa = Double_ADS805_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_readdata_from_sa = Double_ADS805_0_avalon_slave_0_readdata;

  assign nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0 = ({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h902090) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //Double_ADS805_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_arb_share_set_values = 1;

  //Double_ADS805_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_non_bursting_master_requests = nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0 |
    nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0 |
    nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0 |
    nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0;

  //Double_ADS805_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //Double_ADS805_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_arb_share_counter_next_value = Double_ADS805_0_avalon_slave_0_firsttransfer ? (Double_ADS805_0_avalon_slave_0_arb_share_set_values - 1) : |Double_ADS805_0_avalon_slave_0_arb_share_counter ? (Double_ADS805_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //Double_ADS805_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_allgrants = |Double_ADS805_0_avalon_slave_0_grant_vector |
    |Double_ADS805_0_avalon_slave_0_grant_vector |
    |Double_ADS805_0_avalon_slave_0_grant_vector |
    |Double_ADS805_0_avalon_slave_0_grant_vector;

  //Double_ADS805_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_end_xfer = ~(Double_ADS805_0_avalon_slave_0_waits_for_read | Double_ADS805_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_Double_ADS805_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Double_ADS805_0_avalon_slave_0 = Double_ADS805_0_avalon_slave_0_end_xfer & (~Double_ADS805_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Double_ADS805_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_Double_ADS805_0_avalon_slave_0 & Double_ADS805_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_Double_ADS805_0_avalon_slave_0 & ~Double_ADS805_0_avalon_slave_0_non_bursting_master_requests);

  //Double_ADS805_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Double_ADS805_0_avalon_slave_0_arb_share_counter <= 0;
      else if (Double_ADS805_0_avalon_slave_0_arb_counter_enable)
          Double_ADS805_0_avalon_slave_0_arb_share_counter <= Double_ADS805_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //Double_ADS805_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Double_ADS805_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|Double_ADS805_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_Double_ADS805_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_Double_ADS805_0_avalon_slave_0 & ~Double_ADS805_0_avalon_slave_0_non_bursting_master_requests))
          Double_ADS805_0_avalon_slave_0_slavearbiterlockenable <= |Double_ADS805_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //nios_fast/data_master Double_ADS805_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = Double_ADS805_0_avalon_slave_0_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //Double_ADS805_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_slavearbiterlockenable2 = |Double_ADS805_0_avalon_slave_0_arb_share_counter_next_value;

  //nios_fast/data_master Double_ADS805_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = Double_ADS805_0_avalon_slave_0_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //nios_fast/instruction_master Double_ADS805_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock = Double_ADS805_0_avalon_slave_0_slavearbiterlockenable & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master Double_ADS805_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock2 = Double_ADS805_0_avalon_slave_0_slavearbiterlockenable2 & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master granted Double_ADS805_0/avalon_slave_0 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_instruction_master_granted_slave_Double_ADS805_0_avalon_slave_0 <= 0;
      else if (1)
          last_cycle_nios_fast_instruction_master_granted_slave_Double_ADS805_0_avalon_slave_0 <= nios_fast_instruction_master_saved_grant_Double_ADS805_0_avalon_slave_0 ? 1 : (Double_ADS805_0_avalon_slave_0_arbitration_holdoff_internal | ~nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0) ? 0 : last_cycle_nios_fast_instruction_master_granted_slave_Double_ADS805_0_avalon_slave_0;
    end


  //nios_fast_instruction_master_continuerequest continued request, which is an e_mux
  assign nios_fast_instruction_master_continuerequest = last_cycle_nios_fast_instruction_master_granted_slave_Double_ADS805_0_avalon_slave_0 & nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0;

  //Double_ADS805_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_any_continuerequest = nios_fast_instruction_master_continuerequest |
    nios_fast_data_master_continuerequest;

  assign nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0 = nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0 & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))) | nios_fast_instruction_master_arbiterlock);
  //local readdatavalid nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0, which is an e_mux
  assign nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0 = nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_data_master_read & ~Double_ADS805_0_avalon_slave_0_waits_for_read;

  //Double_ADS805_0_avalon_slave_0_writedata mux, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_writedata = nios_fast_data_master_writedata;

  assign nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0 = (({nios_fast_instruction_master_address_to_slave[23 : 4] , 4'b0} == 24'h902090) & (nios_fast_instruction_master_read)) & nios_fast_instruction_master_read;
  //nios_fast/data_master granted Double_ADS805_0/avalon_slave_0 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_data_master_granted_slave_Double_ADS805_0_avalon_slave_0 <= 0;
      else if (1)
          last_cycle_nios_fast_data_master_granted_slave_Double_ADS805_0_avalon_slave_0 <= nios_fast_data_master_saved_grant_Double_ADS805_0_avalon_slave_0 ? 1 : (Double_ADS805_0_avalon_slave_0_arbitration_holdoff_internal | ~nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0) ? 0 : last_cycle_nios_fast_data_master_granted_slave_Double_ADS805_0_avalon_slave_0;
    end


  //nios_fast_data_master_continuerequest continued request, which is an e_mux
  assign nios_fast_data_master_continuerequest = last_cycle_nios_fast_data_master_granted_slave_Double_ADS805_0_avalon_slave_0 & nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0;

  assign nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0 = nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0 & ~((nios_fast_instruction_master_read & ((nios_fast_instruction_master_latency_counter != 0))) | nios_fast_data_master_arbiterlock);
  //local readdatavalid nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0, which is an e_mux
  assign nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0 = nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_instruction_master_read & ~Double_ADS805_0_avalon_slave_0_waits_for_read;

  //allow new arb cycle for Double_ADS805_0/avalon_slave_0, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_allow_new_arb_cycle = ~nios_fast_data_master_arbiterlock & ~nios_fast_instruction_master_arbiterlock;

  //nios_fast/instruction_master assignment into master qualified-requests vector for Double_ADS805_0/avalon_slave_0, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_master_qreq_vector[0] = nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0;

  //nios_fast/instruction_master grant Double_ADS805_0/avalon_slave_0, which is an e_assign
  assign nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0 = Double_ADS805_0_avalon_slave_0_grant_vector[0];

  //nios_fast/instruction_master saved-grant Double_ADS805_0/avalon_slave_0, which is an e_assign
  assign nios_fast_instruction_master_saved_grant_Double_ADS805_0_avalon_slave_0 = Double_ADS805_0_avalon_slave_0_arb_winner[0] && nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0;

  //nios_fast/data_master assignment into master qualified-requests vector for Double_ADS805_0/avalon_slave_0, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_master_qreq_vector[1] = nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0;

  //nios_fast/data_master grant Double_ADS805_0/avalon_slave_0, which is an e_assign
  assign nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 = Double_ADS805_0_avalon_slave_0_grant_vector[1];

  //nios_fast/data_master saved-grant Double_ADS805_0/avalon_slave_0, which is an e_assign
  assign nios_fast_data_master_saved_grant_Double_ADS805_0_avalon_slave_0 = Double_ADS805_0_avalon_slave_0_arb_winner[1] && nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0;

  //Double_ADS805_0/avalon_slave_0 chosen-master double-vector, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_chosen_master_double_vector = {Double_ADS805_0_avalon_slave_0_master_qreq_vector, Double_ADS805_0_avalon_slave_0_master_qreq_vector} & ({~Double_ADS805_0_avalon_slave_0_master_qreq_vector, ~Double_ADS805_0_avalon_slave_0_master_qreq_vector} + Double_ADS805_0_avalon_slave_0_arb_addend);

  //stable onehot encoding of arb winner
  assign Double_ADS805_0_avalon_slave_0_arb_winner = (Double_ADS805_0_avalon_slave_0_allow_new_arb_cycle & | Double_ADS805_0_avalon_slave_0_grant_vector) ? Double_ADS805_0_avalon_slave_0_grant_vector : Double_ADS805_0_avalon_slave_0_saved_chosen_master_vector;

  //saved Double_ADS805_0_avalon_slave_0_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Double_ADS805_0_avalon_slave_0_saved_chosen_master_vector <= 0;
      else if (Double_ADS805_0_avalon_slave_0_allow_new_arb_cycle)
          Double_ADS805_0_avalon_slave_0_saved_chosen_master_vector <= |Double_ADS805_0_avalon_slave_0_grant_vector ? Double_ADS805_0_avalon_slave_0_grant_vector : Double_ADS805_0_avalon_slave_0_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign Double_ADS805_0_avalon_slave_0_grant_vector = {(Double_ADS805_0_avalon_slave_0_chosen_master_double_vector[1] | Double_ADS805_0_avalon_slave_0_chosen_master_double_vector[3]),
    (Double_ADS805_0_avalon_slave_0_chosen_master_double_vector[0] | Double_ADS805_0_avalon_slave_0_chosen_master_double_vector[2])};

  //Double_ADS805_0/avalon_slave_0 chosen master rotated left, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_chosen_master_rot_left = (Double_ADS805_0_avalon_slave_0_arb_winner << 1) ? (Double_ADS805_0_avalon_slave_0_arb_winner << 1) : 1;

  //Double_ADS805_0/avalon_slave_0's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Double_ADS805_0_avalon_slave_0_arb_addend <= 1;
      else if (|Double_ADS805_0_avalon_slave_0_grant_vector)
          Double_ADS805_0_avalon_slave_0_arb_addend <= Double_ADS805_0_avalon_slave_0_end_xfer? Double_ADS805_0_avalon_slave_0_chosen_master_rot_left : Double_ADS805_0_avalon_slave_0_grant_vector;
    end


  //Double_ADS805_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_reset_n = reset_n;

  //Double_ADS805_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_firsttransfer = Double_ADS805_0_avalon_slave_0_begins_xfer ? Double_ADS805_0_avalon_slave_0_unreg_firsttransfer : Double_ADS805_0_avalon_slave_0_reg_firsttransfer;

  //Double_ADS805_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_unreg_firsttransfer = ~(Double_ADS805_0_avalon_slave_0_slavearbiterlockenable & Double_ADS805_0_avalon_slave_0_any_continuerequest);

  //Double_ADS805_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Double_ADS805_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (Double_ADS805_0_avalon_slave_0_begins_xfer)
          Double_ADS805_0_avalon_slave_0_reg_firsttransfer <= Double_ADS805_0_avalon_slave_0_unreg_firsttransfer;
    end


  //Double_ADS805_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_beginbursttransfer_internal = Double_ADS805_0_avalon_slave_0_begins_xfer;

  //Double_ADS805_0_avalon_slave_0_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_arbitration_holdoff_internal = Double_ADS805_0_avalon_slave_0_begins_xfer & Double_ADS805_0_avalon_slave_0_firsttransfer;

  //Double_ADS805_0_avalon_slave_0_read assignment, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_read = (nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_instruction_master_read);

  //Double_ADS805_0_avalon_slave_0_write assignment, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_write = nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_data_master_write;

  assign shifted_address_to_Double_ADS805_0_avalon_slave_0_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //Double_ADS805_0_avalon_slave_0_address mux, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_address = (nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0)? (shifted_address_to_Double_ADS805_0_avalon_slave_0_from_nios_fast_data_master >> 2) :
    (shifted_address_to_Double_ADS805_0_avalon_slave_0_from_nios_fast_instruction_master >> 2);

  assign shifted_address_to_Double_ADS805_0_avalon_slave_0_from_nios_fast_instruction_master = nios_fast_instruction_master_address_to_slave;
  //d1_Double_ADS805_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Double_ADS805_0_avalon_slave_0_end_xfer <= 1;
      else if (1)
          d1_Double_ADS805_0_avalon_slave_0_end_xfer <= Double_ADS805_0_avalon_slave_0_end_xfer;
    end


  //Double_ADS805_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_waits_for_read = Double_ADS805_0_avalon_slave_0_in_a_read_cycle & Double_ADS805_0_avalon_slave_0_begins_xfer;

  //Double_ADS805_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_in_a_read_cycle = (nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Double_ADS805_0_avalon_slave_0_in_a_read_cycle;

  //Double_ADS805_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign Double_ADS805_0_avalon_slave_0_waits_for_write = Double_ADS805_0_avalon_slave_0_in_a_write_cycle & Double_ADS805_0_avalon_slave_0_begins_xfer;

  //Double_ADS805_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_in_a_write_cycle = nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Double_ADS805_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_Double_ADS805_0_avalon_slave_0_counter = 0;
  //assign Double_ADS805_0_avalon_slave_0_irq_from_sa = Double_ADS805_0_avalon_slave_0_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Double_ADS805_0_avalon_slave_0_irq_from_sa = Double_ADS805_0_avalon_slave_0_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Double_ADS805_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 + nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_saved_grant_Double_ADS805_0_avalon_slave_0 + nios_fast_instruction_master_saved_grant_Double_ADS805_0_avalon_slave_0 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module epcs_controller_epcs_control_port_arbitrator (
                                                      // inputs:
                                                       clk,
                                                       epcs_controller_epcs_control_port_dataavailable,
                                                       epcs_controller_epcs_control_port_endofpacket,
                                                       epcs_controller_epcs_control_port_irq,
                                                       epcs_controller_epcs_control_port_readdata,
                                                       epcs_controller_epcs_control_port_readyfordata,
                                                       nios_fast_data_master_address_to_slave,
                                                       nios_fast_data_master_latency_counter,
                                                       nios_fast_data_master_read,
                                                       nios_fast_data_master_write,
                                                       nios_fast_data_master_writedata,
                                                       nios_fast_instruction_master_address_to_slave,
                                                       nios_fast_instruction_master_latency_counter,
                                                       nios_fast_instruction_master_read,
                                                       reset_n,

                                                      // outputs:
                                                       d1_epcs_controller_epcs_control_port_end_xfer,
                                                       epcs_controller_epcs_control_port_address,
                                                       epcs_controller_epcs_control_port_chipselect,
                                                       epcs_controller_epcs_control_port_dataavailable_from_sa,
                                                       epcs_controller_epcs_control_port_endofpacket_from_sa,
                                                       epcs_controller_epcs_control_port_irq_from_sa,
                                                       epcs_controller_epcs_control_port_read_n,
                                                       epcs_controller_epcs_control_port_readdata_from_sa,
                                                       epcs_controller_epcs_control_port_readyfordata_from_sa,
                                                       epcs_controller_epcs_control_port_reset_n,
                                                       epcs_controller_epcs_control_port_write_n,
                                                       epcs_controller_epcs_control_port_writedata,
                                                       nios_fast_data_master_granted_epcs_controller_epcs_control_port,
                                                       nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port,
                                                       nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port,
                                                       nios_fast_data_master_requests_epcs_controller_epcs_control_port,
                                                       nios_fast_instruction_master_granted_epcs_controller_epcs_control_port,
                                                       nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port,
                                                       nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port,
                                                       nios_fast_instruction_master_requests_epcs_controller_epcs_control_port
                                                    )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_epcs_controller_epcs_control_port_end_xfer;
  output  [  8: 0] epcs_controller_epcs_control_port_address;
  output           epcs_controller_epcs_control_port_chipselect;
  output           epcs_controller_epcs_control_port_dataavailable_from_sa;
  output           epcs_controller_epcs_control_port_endofpacket_from_sa;
  output           epcs_controller_epcs_control_port_irq_from_sa;
  output           epcs_controller_epcs_control_port_read_n;
  output  [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  output           epcs_controller_epcs_control_port_readyfordata_from_sa;
  output           epcs_controller_epcs_control_port_reset_n;
  output           epcs_controller_epcs_control_port_write_n;
  output  [ 31: 0] epcs_controller_epcs_control_port_writedata;
  output           nios_fast_data_master_granted_epcs_controller_epcs_control_port;
  output           nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port;
  output           nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port;
  output           nios_fast_data_master_requests_epcs_controller_epcs_control_port;
  output           nios_fast_instruction_master_granted_epcs_controller_epcs_control_port;
  output           nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  output           nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  output           nios_fast_instruction_master_requests_epcs_controller_epcs_control_port;
  input            clk;
  input            epcs_controller_epcs_control_port_dataavailable;
  input            epcs_controller_epcs_control_port_endofpacket;
  input            epcs_controller_epcs_control_port_irq;
  input   [ 31: 0] epcs_controller_epcs_control_port_readdata;
  input            epcs_controller_epcs_control_port_readyfordata;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input   [ 23: 0] nios_fast_instruction_master_address_to_slave;
  input            nios_fast_instruction_master_latency_counter;
  input            nios_fast_instruction_master_read;
  input            reset_n;

  reg              d1_epcs_controller_epcs_control_port_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port;
  wire    [  8: 0] epcs_controller_epcs_control_port_address;
  wire             epcs_controller_epcs_control_port_allgrants;
  wire             epcs_controller_epcs_control_port_allow_new_arb_cycle;
  wire             epcs_controller_epcs_control_port_any_bursting_master_saved_grant;
  wire             epcs_controller_epcs_control_port_any_continuerequest;
  reg     [  1: 0] epcs_controller_epcs_control_port_arb_addend;
  wire             epcs_controller_epcs_control_port_arb_counter_enable;
  reg     [  2: 0] epcs_controller_epcs_control_port_arb_share_counter;
  wire    [  2: 0] epcs_controller_epcs_control_port_arb_share_counter_next_value;
  wire    [  2: 0] epcs_controller_epcs_control_port_arb_share_set_values;
  wire    [  1: 0] epcs_controller_epcs_control_port_arb_winner;
  wire             epcs_controller_epcs_control_port_arbitration_holdoff_internal;
  wire             epcs_controller_epcs_control_port_beginbursttransfer_internal;
  wire             epcs_controller_epcs_control_port_begins_xfer;
  wire             epcs_controller_epcs_control_port_chipselect;
  wire    [  3: 0] epcs_controller_epcs_control_port_chosen_master_double_vector;
  wire    [  1: 0] epcs_controller_epcs_control_port_chosen_master_rot_left;
  wire             epcs_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_controller_epcs_control_port_end_xfer;
  wire             epcs_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_controller_epcs_control_port_firsttransfer;
  wire    [  1: 0] epcs_controller_epcs_control_port_grant_vector;
  wire             epcs_controller_epcs_control_port_in_a_read_cycle;
  wire             epcs_controller_epcs_control_port_in_a_write_cycle;
  wire             epcs_controller_epcs_control_port_irq_from_sa;
  wire    [  1: 0] epcs_controller_epcs_control_port_master_qreq_vector;
  wire             epcs_controller_epcs_control_port_non_bursting_master_requests;
  wire             epcs_controller_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  wire             epcs_controller_epcs_control_port_readyfordata_from_sa;
  reg              epcs_controller_epcs_control_port_reg_firsttransfer;
  wire             epcs_controller_epcs_control_port_reset_n;
  reg     [  1: 0] epcs_controller_epcs_control_port_saved_chosen_master_vector;
  reg              epcs_controller_epcs_control_port_slavearbiterlockenable;
  wire             epcs_controller_epcs_control_port_slavearbiterlockenable2;
  wire             epcs_controller_epcs_control_port_unreg_firsttransfer;
  wire             epcs_controller_epcs_control_port_waits_for_read;
  wire             epcs_controller_epcs_control_port_waits_for_write;
  wire             epcs_controller_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_nios_fast_data_master_granted_slave_epcs_controller_epcs_control_port;
  reg              last_cycle_nios_fast_instruction_master_granted_slave_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_requests_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_saved_grant_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_arbiterlock;
  wire             nios_fast_instruction_master_arbiterlock2;
  wire             nios_fast_instruction_master_continuerequest;
  wire             nios_fast_instruction_master_granted_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_requests_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_saved_grant_epcs_controller_epcs_control_port;
  wire    [ 23: 0] shifted_address_to_epcs_controller_epcs_control_port_from_nios_fast_data_master;
  wire    [ 23: 0] shifted_address_to_epcs_controller_epcs_control_port_from_nios_fast_instruction_master;
  wire             wait_for_epcs_controller_epcs_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~epcs_controller_epcs_control_port_end_xfer;
    end


  assign epcs_controller_epcs_control_port_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port | nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port));
  //assign epcs_controller_epcs_control_port_readdata_from_sa = epcs_controller_epcs_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_readdata_from_sa = epcs_controller_epcs_control_port_readdata;

  assign nios_fast_data_master_requests_epcs_controller_epcs_control_port = ({nios_fast_data_master_address_to_slave[23 : 11] , 11'b0} == 24'h901800) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //assign epcs_controller_epcs_control_port_dataavailable_from_sa = epcs_controller_epcs_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_dataavailable_from_sa = epcs_controller_epcs_control_port_dataavailable;

  //assign epcs_controller_epcs_control_port_readyfordata_from_sa = epcs_controller_epcs_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_readyfordata_from_sa = epcs_controller_epcs_control_port_readyfordata;

  //epcs_controller_epcs_control_port_arb_share_counter set values, which is an e_mux
  assign epcs_controller_epcs_control_port_arb_share_set_values = 1;

  //epcs_controller_epcs_control_port_non_bursting_master_requests mux, which is an e_mux
  assign epcs_controller_epcs_control_port_non_bursting_master_requests = nios_fast_data_master_requests_epcs_controller_epcs_control_port |
    nios_fast_instruction_master_requests_epcs_controller_epcs_control_port |
    nios_fast_data_master_requests_epcs_controller_epcs_control_port |
    nios_fast_instruction_master_requests_epcs_controller_epcs_control_port;

  //epcs_controller_epcs_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign epcs_controller_epcs_control_port_any_bursting_master_saved_grant = 0;

  //epcs_controller_epcs_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_arb_share_counter_next_value = epcs_controller_epcs_control_port_firsttransfer ? (epcs_controller_epcs_control_port_arb_share_set_values - 1) : |epcs_controller_epcs_control_port_arb_share_counter ? (epcs_controller_epcs_control_port_arb_share_counter - 1) : 0;

  //epcs_controller_epcs_control_port_allgrants all slave grants, which is an e_mux
  assign epcs_controller_epcs_control_port_allgrants = |epcs_controller_epcs_control_port_grant_vector |
    |epcs_controller_epcs_control_port_grant_vector |
    |epcs_controller_epcs_control_port_grant_vector |
    |epcs_controller_epcs_control_port_grant_vector;

  //epcs_controller_epcs_control_port_end_xfer assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_end_xfer = ~(epcs_controller_epcs_control_port_waits_for_read | epcs_controller_epcs_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_end_xfer & (~epcs_controller_epcs_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //epcs_controller_epcs_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign epcs_controller_epcs_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port & epcs_controller_epcs_control_port_allgrants) | (end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port & ~epcs_controller_epcs_control_port_non_bursting_master_requests);

  //epcs_controller_epcs_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_arb_share_counter <= 0;
      else if (epcs_controller_epcs_control_port_arb_counter_enable)
          epcs_controller_epcs_control_port_arb_share_counter <= epcs_controller_epcs_control_port_arb_share_counter_next_value;
    end


  //epcs_controller_epcs_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_slavearbiterlockenable <= 0;
      else if ((|epcs_controller_epcs_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port) | (end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port & ~epcs_controller_epcs_control_port_non_bursting_master_requests))
          epcs_controller_epcs_control_port_slavearbiterlockenable <= |epcs_controller_epcs_control_port_arb_share_counter_next_value;
    end


  //nios_fast/data_master epcs_controller/epcs_control_port arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = epcs_controller_epcs_control_port_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //epcs_controller_epcs_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign epcs_controller_epcs_control_port_slavearbiterlockenable2 = |epcs_controller_epcs_control_port_arb_share_counter_next_value;

  //nios_fast/data_master epcs_controller/epcs_control_port arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = epcs_controller_epcs_control_port_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //nios_fast/instruction_master epcs_controller/epcs_control_port arbiterlock, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock = epcs_controller_epcs_control_port_slavearbiterlockenable & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master epcs_controller/epcs_control_port arbiterlock2, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock2 = epcs_controller_epcs_control_port_slavearbiterlockenable2 & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master granted epcs_controller/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_instruction_master_granted_slave_epcs_controller_epcs_control_port <= 0;
      else if (1)
          last_cycle_nios_fast_instruction_master_granted_slave_epcs_controller_epcs_control_port <= nios_fast_instruction_master_saved_grant_epcs_controller_epcs_control_port ? 1 : (epcs_controller_epcs_control_port_arbitration_holdoff_internal | ~nios_fast_instruction_master_requests_epcs_controller_epcs_control_port) ? 0 : last_cycle_nios_fast_instruction_master_granted_slave_epcs_controller_epcs_control_port;
    end


  //nios_fast_instruction_master_continuerequest continued request, which is an e_mux
  assign nios_fast_instruction_master_continuerequest = last_cycle_nios_fast_instruction_master_granted_slave_epcs_controller_epcs_control_port & nios_fast_instruction_master_requests_epcs_controller_epcs_control_port;

  //epcs_controller_epcs_control_port_any_continuerequest at least one master continues requesting, which is an e_mux
  assign epcs_controller_epcs_control_port_any_continuerequest = nios_fast_instruction_master_continuerequest |
    nios_fast_data_master_continuerequest;

  assign nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port = nios_fast_data_master_requests_epcs_controller_epcs_control_port & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))) | nios_fast_instruction_master_arbiterlock);
  //local readdatavalid nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port, which is an e_mux
  assign nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port = nios_fast_data_master_granted_epcs_controller_epcs_control_port & nios_fast_data_master_read & ~epcs_controller_epcs_control_port_waits_for_read;

  //epcs_controller_epcs_control_port_writedata mux, which is an e_mux
  assign epcs_controller_epcs_control_port_writedata = nios_fast_data_master_writedata;

  //assign epcs_controller_epcs_control_port_endofpacket_from_sa = epcs_controller_epcs_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_endofpacket_from_sa = epcs_controller_epcs_control_port_endofpacket;

  assign nios_fast_instruction_master_requests_epcs_controller_epcs_control_port = (({nios_fast_instruction_master_address_to_slave[23 : 11] , 11'b0} == 24'h901800) & (nios_fast_instruction_master_read)) & nios_fast_instruction_master_read;
  //nios_fast/data_master granted epcs_controller/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_data_master_granted_slave_epcs_controller_epcs_control_port <= 0;
      else if (1)
          last_cycle_nios_fast_data_master_granted_slave_epcs_controller_epcs_control_port <= nios_fast_data_master_saved_grant_epcs_controller_epcs_control_port ? 1 : (epcs_controller_epcs_control_port_arbitration_holdoff_internal | ~nios_fast_data_master_requests_epcs_controller_epcs_control_port) ? 0 : last_cycle_nios_fast_data_master_granted_slave_epcs_controller_epcs_control_port;
    end


  //nios_fast_data_master_continuerequest continued request, which is an e_mux
  assign nios_fast_data_master_continuerequest = last_cycle_nios_fast_data_master_granted_slave_epcs_controller_epcs_control_port & nios_fast_data_master_requests_epcs_controller_epcs_control_port;

  assign nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port = nios_fast_instruction_master_requests_epcs_controller_epcs_control_port & ~((nios_fast_instruction_master_read & ((nios_fast_instruction_master_latency_counter != 0))) | nios_fast_data_master_arbiterlock);
  //local readdatavalid nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port, which is an e_mux
  assign nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port = nios_fast_instruction_master_granted_epcs_controller_epcs_control_port & nios_fast_instruction_master_read & ~epcs_controller_epcs_control_port_waits_for_read;

  //allow new arb cycle for epcs_controller/epcs_control_port, which is an e_assign
  assign epcs_controller_epcs_control_port_allow_new_arb_cycle = ~nios_fast_data_master_arbiterlock & ~nios_fast_instruction_master_arbiterlock;

  //nios_fast/instruction_master assignment into master qualified-requests vector for epcs_controller/epcs_control_port, which is an e_assign
  assign epcs_controller_epcs_control_port_master_qreq_vector[0] = nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port;

  //nios_fast/instruction_master grant epcs_controller/epcs_control_port, which is an e_assign
  assign nios_fast_instruction_master_granted_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_grant_vector[0];

  //nios_fast/instruction_master saved-grant epcs_controller/epcs_control_port, which is an e_assign
  assign nios_fast_instruction_master_saved_grant_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_arb_winner[0] && nios_fast_instruction_master_requests_epcs_controller_epcs_control_port;

  //nios_fast/data_master assignment into master qualified-requests vector for epcs_controller/epcs_control_port, which is an e_assign
  assign epcs_controller_epcs_control_port_master_qreq_vector[1] = nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port;

  //nios_fast/data_master grant epcs_controller/epcs_control_port, which is an e_assign
  assign nios_fast_data_master_granted_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_grant_vector[1];

  //nios_fast/data_master saved-grant epcs_controller/epcs_control_port, which is an e_assign
  assign nios_fast_data_master_saved_grant_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_arb_winner[1] && nios_fast_data_master_requests_epcs_controller_epcs_control_port;

  //epcs_controller/epcs_control_port chosen-master double-vector, which is an e_assign
  assign epcs_controller_epcs_control_port_chosen_master_double_vector = {epcs_controller_epcs_control_port_master_qreq_vector, epcs_controller_epcs_control_port_master_qreq_vector} & ({~epcs_controller_epcs_control_port_master_qreq_vector, ~epcs_controller_epcs_control_port_master_qreq_vector} + epcs_controller_epcs_control_port_arb_addend);

  //stable onehot encoding of arb winner
  assign epcs_controller_epcs_control_port_arb_winner = (epcs_controller_epcs_control_port_allow_new_arb_cycle & | epcs_controller_epcs_control_port_grant_vector) ? epcs_controller_epcs_control_port_grant_vector : epcs_controller_epcs_control_port_saved_chosen_master_vector;

  //saved epcs_controller_epcs_control_port_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_saved_chosen_master_vector <= 0;
      else if (epcs_controller_epcs_control_port_allow_new_arb_cycle)
          epcs_controller_epcs_control_port_saved_chosen_master_vector <= |epcs_controller_epcs_control_port_grant_vector ? epcs_controller_epcs_control_port_grant_vector : epcs_controller_epcs_control_port_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign epcs_controller_epcs_control_port_grant_vector = {(epcs_controller_epcs_control_port_chosen_master_double_vector[1] | epcs_controller_epcs_control_port_chosen_master_double_vector[3]),
    (epcs_controller_epcs_control_port_chosen_master_double_vector[0] | epcs_controller_epcs_control_port_chosen_master_double_vector[2])};

  //epcs_controller/epcs_control_port chosen master rotated left, which is an e_assign
  assign epcs_controller_epcs_control_port_chosen_master_rot_left = (epcs_controller_epcs_control_port_arb_winner << 1) ? (epcs_controller_epcs_control_port_arb_winner << 1) : 1;

  //epcs_controller/epcs_control_port's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_arb_addend <= 1;
      else if (|epcs_controller_epcs_control_port_grant_vector)
          epcs_controller_epcs_control_port_arb_addend <= epcs_controller_epcs_control_port_end_xfer? epcs_controller_epcs_control_port_chosen_master_rot_left : epcs_controller_epcs_control_port_grant_vector;
    end


  //epcs_controller_epcs_control_port_reset_n assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_reset_n = reset_n;

  assign epcs_controller_epcs_control_port_chipselect = nios_fast_data_master_granted_epcs_controller_epcs_control_port | nios_fast_instruction_master_granted_epcs_controller_epcs_control_port;
  //epcs_controller_epcs_control_port_firsttransfer first transaction, which is an e_assign
  assign epcs_controller_epcs_control_port_firsttransfer = epcs_controller_epcs_control_port_begins_xfer ? epcs_controller_epcs_control_port_unreg_firsttransfer : epcs_controller_epcs_control_port_reg_firsttransfer;

  //epcs_controller_epcs_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign epcs_controller_epcs_control_port_unreg_firsttransfer = ~(epcs_controller_epcs_control_port_slavearbiterlockenable & epcs_controller_epcs_control_port_any_continuerequest);

  //epcs_controller_epcs_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_reg_firsttransfer <= 1'b1;
      else if (epcs_controller_epcs_control_port_begins_xfer)
          epcs_controller_epcs_control_port_reg_firsttransfer <= epcs_controller_epcs_control_port_unreg_firsttransfer;
    end


  //epcs_controller_epcs_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign epcs_controller_epcs_control_port_beginbursttransfer_internal = epcs_controller_epcs_control_port_begins_xfer;

  //epcs_controller_epcs_control_port_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign epcs_controller_epcs_control_port_arbitration_holdoff_internal = epcs_controller_epcs_control_port_begins_xfer & epcs_controller_epcs_control_port_firsttransfer;

  //~epcs_controller_epcs_control_port_read_n assignment, which is an e_mux
  assign epcs_controller_epcs_control_port_read_n = ~((nios_fast_data_master_granted_epcs_controller_epcs_control_port & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_epcs_controller_epcs_control_port & nios_fast_instruction_master_read));

  //~epcs_controller_epcs_control_port_write_n assignment, which is an e_mux
  assign epcs_controller_epcs_control_port_write_n = ~(nios_fast_data_master_granted_epcs_controller_epcs_control_port & nios_fast_data_master_write);

  assign shifted_address_to_epcs_controller_epcs_control_port_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //epcs_controller_epcs_control_port_address mux, which is an e_mux
  assign epcs_controller_epcs_control_port_address = (nios_fast_data_master_granted_epcs_controller_epcs_control_port)? (shifted_address_to_epcs_controller_epcs_control_port_from_nios_fast_data_master >> 2) :
    (shifted_address_to_epcs_controller_epcs_control_port_from_nios_fast_instruction_master >> 2);

  assign shifted_address_to_epcs_controller_epcs_control_port_from_nios_fast_instruction_master = nios_fast_instruction_master_address_to_slave;
  //d1_epcs_controller_epcs_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_epcs_controller_epcs_control_port_end_xfer <= 1;
      else if (1)
          d1_epcs_controller_epcs_control_port_end_xfer <= epcs_controller_epcs_control_port_end_xfer;
    end


  //epcs_controller_epcs_control_port_waits_for_read in a cycle, which is an e_mux
  assign epcs_controller_epcs_control_port_waits_for_read = epcs_controller_epcs_control_port_in_a_read_cycle & epcs_controller_epcs_control_port_begins_xfer;

  //epcs_controller_epcs_control_port_in_a_read_cycle assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_in_a_read_cycle = (nios_fast_data_master_granted_epcs_controller_epcs_control_port & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_epcs_controller_epcs_control_port & nios_fast_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = epcs_controller_epcs_control_port_in_a_read_cycle;

  //epcs_controller_epcs_control_port_waits_for_write in a cycle, which is an e_mux
  assign epcs_controller_epcs_control_port_waits_for_write = epcs_controller_epcs_control_port_in_a_write_cycle & epcs_controller_epcs_control_port_begins_xfer;

  //epcs_controller_epcs_control_port_in_a_write_cycle assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_in_a_write_cycle = nios_fast_data_master_granted_epcs_controller_epcs_control_port & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = epcs_controller_epcs_control_port_in_a_write_cycle;

  assign wait_for_epcs_controller_epcs_control_port_counter = 0;
  //assign epcs_controller_epcs_control_port_irq_from_sa = epcs_controller_epcs_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_irq_from_sa = epcs_controller_epcs_control_port_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //epcs_controller/epcs_control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_granted_epcs_controller_epcs_control_port + nios_fast_instruction_master_granted_epcs_controller_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_saved_grant_epcs_controller_epcs_control_port + nios_fast_instruction_master_saved_grant_epcs_controller_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module freq_avalon_0_avalon_slave_0_arbitrator (
                                                 // inputs:
                                                  clk,
                                                  freq_avalon_0_avalon_slave_0_readdata,
                                                  nios_fast_data_master_address_to_slave,
                                                  nios_fast_data_master_latency_counter,
                                                  nios_fast_data_master_read,
                                                  nios_fast_data_master_write,
                                                  nios_fast_data_master_writedata,
                                                  reset_n,

                                                 // outputs:
                                                  d1_freq_avalon_0_avalon_slave_0_end_xfer,
                                                  freq_avalon_0_avalon_slave_0_address,
                                                  freq_avalon_0_avalon_slave_0_read,
                                                  freq_avalon_0_avalon_slave_0_readdata_from_sa,
                                                  freq_avalon_0_avalon_slave_0_reset_n,
                                                  freq_avalon_0_avalon_slave_0_write,
                                                  freq_avalon_0_avalon_slave_0_writedata,
                                                  nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0,
                                                  nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0,
                                                  nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0,
                                                  nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0
                                               )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_freq_avalon_0_avalon_slave_0_end_xfer;
  output  [  1: 0] freq_avalon_0_avalon_slave_0_address;
  output           freq_avalon_0_avalon_slave_0_read;
  output  [ 31: 0] freq_avalon_0_avalon_slave_0_readdata_from_sa;
  output           freq_avalon_0_avalon_slave_0_reset_n;
  output           freq_avalon_0_avalon_slave_0_write;
  output  [ 31: 0] freq_avalon_0_avalon_slave_0_writedata;
  output           nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0;
  output           nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0;
  output           nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0;
  output           nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0;
  input            clk;
  input   [ 31: 0] freq_avalon_0_avalon_slave_0_readdata;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;

  reg              d1_freq_avalon_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_freq_avalon_0_avalon_slave_0;
  wire    [  1: 0] freq_avalon_0_avalon_slave_0_address;
  wire             freq_avalon_0_avalon_slave_0_allgrants;
  wire             freq_avalon_0_avalon_slave_0_allow_new_arb_cycle;
  wire             freq_avalon_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             freq_avalon_0_avalon_slave_0_any_continuerequest;
  wire             freq_avalon_0_avalon_slave_0_arb_counter_enable;
  reg     [  2: 0] freq_avalon_0_avalon_slave_0_arb_share_counter;
  wire    [  2: 0] freq_avalon_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  2: 0] freq_avalon_0_avalon_slave_0_arb_share_set_values;
  wire             freq_avalon_0_avalon_slave_0_beginbursttransfer_internal;
  wire             freq_avalon_0_avalon_slave_0_begins_xfer;
  wire             freq_avalon_0_avalon_slave_0_end_xfer;
  wire             freq_avalon_0_avalon_slave_0_firsttransfer;
  wire             freq_avalon_0_avalon_slave_0_grant_vector;
  wire             freq_avalon_0_avalon_slave_0_in_a_read_cycle;
  wire             freq_avalon_0_avalon_slave_0_in_a_write_cycle;
  wire             freq_avalon_0_avalon_slave_0_master_qreq_vector;
  wire             freq_avalon_0_avalon_slave_0_non_bursting_master_requests;
  wire             freq_avalon_0_avalon_slave_0_read;
  wire    [ 31: 0] freq_avalon_0_avalon_slave_0_readdata_from_sa;
  reg              freq_avalon_0_avalon_slave_0_reg_firsttransfer;
  wire             freq_avalon_0_avalon_slave_0_reset_n;
  reg              freq_avalon_0_avalon_slave_0_slavearbiterlockenable;
  wire             freq_avalon_0_avalon_slave_0_slavearbiterlockenable2;
  wire             freq_avalon_0_avalon_slave_0_unreg_firsttransfer;
  wire             freq_avalon_0_avalon_slave_0_waits_for_read;
  wire             freq_avalon_0_avalon_slave_0_waits_for_write;
  wire             freq_avalon_0_avalon_slave_0_write;
  wire    [ 31: 0] freq_avalon_0_avalon_slave_0_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_saved_grant_freq_avalon_0_avalon_slave_0;
  wire    [ 23: 0] shifted_address_to_freq_avalon_0_avalon_slave_0_from_nios_fast_data_master;
  wire             wait_for_freq_avalon_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~freq_avalon_0_avalon_slave_0_end_xfer;
    end


  assign freq_avalon_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0));
  //assign freq_avalon_0_avalon_slave_0_readdata_from_sa = freq_avalon_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_readdata_from_sa = freq_avalon_0_avalon_slave_0_readdata;

  assign nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0 = ({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h9020a0) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //freq_avalon_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_arb_share_set_values = 1;

  //freq_avalon_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_non_bursting_master_requests = nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0;

  //freq_avalon_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //freq_avalon_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_arb_share_counter_next_value = freq_avalon_0_avalon_slave_0_firsttransfer ? (freq_avalon_0_avalon_slave_0_arb_share_set_values - 1) : |freq_avalon_0_avalon_slave_0_arb_share_counter ? (freq_avalon_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //freq_avalon_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_allgrants = |freq_avalon_0_avalon_slave_0_grant_vector;

  //freq_avalon_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_end_xfer = ~(freq_avalon_0_avalon_slave_0_waits_for_read | freq_avalon_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_freq_avalon_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_freq_avalon_0_avalon_slave_0 = freq_avalon_0_avalon_slave_0_end_xfer & (~freq_avalon_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //freq_avalon_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_freq_avalon_0_avalon_slave_0 & freq_avalon_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_freq_avalon_0_avalon_slave_0 & ~freq_avalon_0_avalon_slave_0_non_bursting_master_requests);

  //freq_avalon_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          freq_avalon_0_avalon_slave_0_arb_share_counter <= 0;
      else if (freq_avalon_0_avalon_slave_0_arb_counter_enable)
          freq_avalon_0_avalon_slave_0_arb_share_counter <= freq_avalon_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //freq_avalon_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          freq_avalon_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|freq_avalon_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_freq_avalon_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_freq_avalon_0_avalon_slave_0 & ~freq_avalon_0_avalon_slave_0_non_bursting_master_requests))
          freq_avalon_0_avalon_slave_0_slavearbiterlockenable <= |freq_avalon_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //nios_fast/data_master freq_avalon_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = freq_avalon_0_avalon_slave_0_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //freq_avalon_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_slavearbiterlockenable2 = |freq_avalon_0_avalon_slave_0_arb_share_counter_next_value;

  //nios_fast/data_master freq_avalon_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = freq_avalon_0_avalon_slave_0_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //freq_avalon_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0 = nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0 & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))));
  //local readdatavalid nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0, which is an e_mux
  assign nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0 = nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0 & nios_fast_data_master_read & ~freq_avalon_0_avalon_slave_0_waits_for_read;

  //freq_avalon_0_avalon_slave_0_writedata mux, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0 = nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0;

  //nios_fast/data_master saved-grant freq_avalon_0/avalon_slave_0, which is an e_assign
  assign nios_fast_data_master_saved_grant_freq_avalon_0_avalon_slave_0 = nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0;

  //allow new arb cycle for freq_avalon_0/avalon_slave_0, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign freq_avalon_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign freq_avalon_0_avalon_slave_0_master_qreq_vector = 1;

  //freq_avalon_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_reset_n = reset_n;

  //freq_avalon_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_firsttransfer = freq_avalon_0_avalon_slave_0_begins_xfer ? freq_avalon_0_avalon_slave_0_unreg_firsttransfer : freq_avalon_0_avalon_slave_0_reg_firsttransfer;

  //freq_avalon_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_unreg_firsttransfer = ~(freq_avalon_0_avalon_slave_0_slavearbiterlockenable & freq_avalon_0_avalon_slave_0_any_continuerequest);

  //freq_avalon_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          freq_avalon_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (freq_avalon_0_avalon_slave_0_begins_xfer)
          freq_avalon_0_avalon_slave_0_reg_firsttransfer <= freq_avalon_0_avalon_slave_0_unreg_firsttransfer;
    end


  //freq_avalon_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_beginbursttransfer_internal = freq_avalon_0_avalon_slave_0_begins_xfer;

  //freq_avalon_0_avalon_slave_0_read assignment, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_read = nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0 & nios_fast_data_master_read;

  //freq_avalon_0_avalon_slave_0_write assignment, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_write = nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0 & nios_fast_data_master_write;

  assign shifted_address_to_freq_avalon_0_avalon_slave_0_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //freq_avalon_0_avalon_slave_0_address mux, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_address = shifted_address_to_freq_avalon_0_avalon_slave_0_from_nios_fast_data_master >> 2;

  //d1_freq_avalon_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_freq_avalon_0_avalon_slave_0_end_xfer <= 1;
      else if (1)
          d1_freq_avalon_0_avalon_slave_0_end_xfer <= freq_avalon_0_avalon_slave_0_end_xfer;
    end


  //freq_avalon_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_waits_for_read = freq_avalon_0_avalon_slave_0_in_a_read_cycle & 0;

  //freq_avalon_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_in_a_read_cycle = nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = freq_avalon_0_avalon_slave_0_in_a_read_cycle;

  //freq_avalon_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign freq_avalon_0_avalon_slave_0_waits_for_write = freq_avalon_0_avalon_slave_0_in_a_write_cycle & freq_avalon_0_avalon_slave_0_begins_xfer;

  //freq_avalon_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign freq_avalon_0_avalon_slave_0_in_a_write_cycle = nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = freq_avalon_0_avalon_slave_0_in_a_write_cycle;

  assign wait_for_freq_avalon_0_avalon_slave_0_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //freq_avalon_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 nios_fast_data_master_address_to_slave,
                                                 nios_fast_data_master_latency_counter,
                                                 nios_fast_data_master_read,
                                                 nios_fast_data_master_write,
                                                 nios_fast_data_master_writedata,
                                                 reset_n,

                                                // outputs:
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata,
                                                 nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave
                                              )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  output           nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            clk;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;

  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  wire    [ 23: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_nios_fast_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave = ({nios_fast_data_master_address_to_slave[23 : 3] , 3'b0} == 24'h9020b0) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //nios_fast/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //nios_fast/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave = nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))));
  //local readdatavalid nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave, which is an e_mux
  assign nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave = nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave & nios_fast_data_master_read & ~jtag_uart_avalon_jtag_slave_waits_for_read;

  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave = nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //nios_fast/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign nios_fast_data_master_saved_grant_jtag_uart_avalon_jtag_slave = nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave & nios_fast_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave & nios_fast_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_nios_fast_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else if (1)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_AO_s1_arbitrator (
                              // inputs:
                               clk,
                               nios_fast_data_master_address_to_slave,
                               nios_fast_data_master_latency_counter,
                               nios_fast_data_master_read,
                               nios_fast_data_master_write,
                               nios_fast_data_master_writedata,
                               reset_n,

                              // outputs:
                               d1_lcd_AO_s1_end_xfer,
                               lcd_AO_s1_address,
                               lcd_AO_s1_chipselect,
                               lcd_AO_s1_reset_n,
                               lcd_AO_s1_write_n,
                               lcd_AO_s1_writedata,
                               nios_fast_data_master_granted_lcd_AO_s1,
                               nios_fast_data_master_qualified_request_lcd_AO_s1,
                               nios_fast_data_master_read_data_valid_lcd_AO_s1,
                               nios_fast_data_master_requests_lcd_AO_s1
                            )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_lcd_AO_s1_end_xfer;
  output  [  1: 0] lcd_AO_s1_address;
  output           lcd_AO_s1_chipselect;
  output           lcd_AO_s1_reset_n;
  output           lcd_AO_s1_write_n;
  output           lcd_AO_s1_writedata;
  output           nios_fast_data_master_granted_lcd_AO_s1;
  output           nios_fast_data_master_qualified_request_lcd_AO_s1;
  output           nios_fast_data_master_read_data_valid_lcd_AO_s1;
  output           nios_fast_data_master_requests_lcd_AO_s1;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;

  reg              d1_lcd_AO_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_AO_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_AO_s1_address;
  wire             lcd_AO_s1_allgrants;
  wire             lcd_AO_s1_allow_new_arb_cycle;
  wire             lcd_AO_s1_any_bursting_master_saved_grant;
  wire             lcd_AO_s1_any_continuerequest;
  wire             lcd_AO_s1_arb_counter_enable;
  reg     [  2: 0] lcd_AO_s1_arb_share_counter;
  wire    [  2: 0] lcd_AO_s1_arb_share_counter_next_value;
  wire    [  2: 0] lcd_AO_s1_arb_share_set_values;
  wire             lcd_AO_s1_beginbursttransfer_internal;
  wire             lcd_AO_s1_begins_xfer;
  wire             lcd_AO_s1_chipselect;
  wire             lcd_AO_s1_end_xfer;
  wire             lcd_AO_s1_firsttransfer;
  wire             lcd_AO_s1_grant_vector;
  wire             lcd_AO_s1_in_a_read_cycle;
  wire             lcd_AO_s1_in_a_write_cycle;
  wire             lcd_AO_s1_master_qreq_vector;
  wire             lcd_AO_s1_non_bursting_master_requests;
  reg              lcd_AO_s1_reg_firsttransfer;
  wire             lcd_AO_s1_reset_n;
  reg              lcd_AO_s1_slavearbiterlockenable;
  wire             lcd_AO_s1_slavearbiterlockenable2;
  wire             lcd_AO_s1_unreg_firsttransfer;
  wire             lcd_AO_s1_waits_for_read;
  wire             lcd_AO_s1_waits_for_write;
  wire             lcd_AO_s1_write_n;
  wire             lcd_AO_s1_writedata;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_lcd_AO_s1;
  wire             nios_fast_data_master_qualified_request_lcd_AO_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_AO_s1;
  wire             nios_fast_data_master_requests_lcd_AO_s1;
  wire             nios_fast_data_master_saved_grant_lcd_AO_s1;
  wire    [ 23: 0] shifted_address_to_lcd_AO_s1_from_nios_fast_data_master;
  wire             wait_for_lcd_AO_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~lcd_AO_s1_end_xfer;
    end


  assign lcd_AO_s1_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_lcd_AO_s1));
  assign nios_fast_data_master_requests_lcd_AO_s1 = (({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h902040) & (nios_fast_data_master_read | nios_fast_data_master_write)) & nios_fast_data_master_write;
  //lcd_AO_s1_arb_share_counter set values, which is an e_mux
  assign lcd_AO_s1_arb_share_set_values = 1;

  //lcd_AO_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_AO_s1_non_bursting_master_requests = nios_fast_data_master_requests_lcd_AO_s1;

  //lcd_AO_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_AO_s1_any_bursting_master_saved_grant = 0;

  //lcd_AO_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_AO_s1_arb_share_counter_next_value = lcd_AO_s1_firsttransfer ? (lcd_AO_s1_arb_share_set_values - 1) : |lcd_AO_s1_arb_share_counter ? (lcd_AO_s1_arb_share_counter - 1) : 0;

  //lcd_AO_s1_allgrants all slave grants, which is an e_mux
  assign lcd_AO_s1_allgrants = |lcd_AO_s1_grant_vector;

  //lcd_AO_s1_end_xfer assignment, which is an e_assign
  assign lcd_AO_s1_end_xfer = ~(lcd_AO_s1_waits_for_read | lcd_AO_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_AO_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_AO_s1 = lcd_AO_s1_end_xfer & (~lcd_AO_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_AO_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_AO_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_AO_s1 & lcd_AO_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_AO_s1 & ~lcd_AO_s1_non_bursting_master_requests);

  //lcd_AO_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_AO_s1_arb_share_counter <= 0;
      else if (lcd_AO_s1_arb_counter_enable)
          lcd_AO_s1_arb_share_counter <= lcd_AO_s1_arb_share_counter_next_value;
    end


  //lcd_AO_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_AO_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_AO_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_AO_s1) | (end_xfer_arb_share_counter_term_lcd_AO_s1 & ~lcd_AO_s1_non_bursting_master_requests))
          lcd_AO_s1_slavearbiterlockenable <= |lcd_AO_s1_arb_share_counter_next_value;
    end


  //nios_fast/data_master lcd_AO/s1 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = lcd_AO_s1_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //lcd_AO_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_AO_s1_slavearbiterlockenable2 = |lcd_AO_s1_arb_share_counter_next_value;

  //nios_fast/data_master lcd_AO/s1 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = lcd_AO_s1_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //lcd_AO_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_AO_s1_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_lcd_AO_s1 = nios_fast_data_master_requests_lcd_AO_s1;
  //local readdatavalid nios_fast_data_master_read_data_valid_lcd_AO_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_lcd_AO_s1 = nios_fast_data_master_granted_lcd_AO_s1 & nios_fast_data_master_read & ~lcd_AO_s1_waits_for_read;

  //lcd_AO_s1_writedata mux, which is an e_mux
  assign lcd_AO_s1_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_lcd_AO_s1 = nios_fast_data_master_qualified_request_lcd_AO_s1;

  //nios_fast/data_master saved-grant lcd_AO/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_lcd_AO_s1 = nios_fast_data_master_requests_lcd_AO_s1;

  //allow new arb cycle for lcd_AO/s1, which is an e_assign
  assign lcd_AO_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_AO_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_AO_s1_master_qreq_vector = 1;

  //lcd_AO_s1_reset_n assignment, which is an e_assign
  assign lcd_AO_s1_reset_n = reset_n;

  assign lcd_AO_s1_chipselect = nios_fast_data_master_granted_lcd_AO_s1;
  //lcd_AO_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_AO_s1_firsttransfer = lcd_AO_s1_begins_xfer ? lcd_AO_s1_unreg_firsttransfer : lcd_AO_s1_reg_firsttransfer;

  //lcd_AO_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_AO_s1_unreg_firsttransfer = ~(lcd_AO_s1_slavearbiterlockenable & lcd_AO_s1_any_continuerequest);

  //lcd_AO_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_AO_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_AO_s1_begins_xfer)
          lcd_AO_s1_reg_firsttransfer <= lcd_AO_s1_unreg_firsttransfer;
    end


  //lcd_AO_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_AO_s1_beginbursttransfer_internal = lcd_AO_s1_begins_xfer;

  //~lcd_AO_s1_write_n assignment, which is an e_mux
  assign lcd_AO_s1_write_n = ~(nios_fast_data_master_granted_lcd_AO_s1 & nios_fast_data_master_write);

  assign shifted_address_to_lcd_AO_s1_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //lcd_AO_s1_address mux, which is an e_mux
  assign lcd_AO_s1_address = shifted_address_to_lcd_AO_s1_from_nios_fast_data_master >> 2;

  //d1_lcd_AO_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_AO_s1_end_xfer <= 1;
      else if (1)
          d1_lcd_AO_s1_end_xfer <= lcd_AO_s1_end_xfer;
    end


  //lcd_AO_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_AO_s1_waits_for_read = lcd_AO_s1_in_a_read_cycle & lcd_AO_s1_begins_xfer;

  //lcd_AO_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_AO_s1_in_a_read_cycle = nios_fast_data_master_granted_lcd_AO_s1 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_AO_s1_in_a_read_cycle;

  //lcd_AO_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_AO_s1_waits_for_write = lcd_AO_s1_in_a_write_cycle & 0;

  //lcd_AO_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_AO_s1_in_a_write_cycle = nios_fast_data_master_granted_lcd_AO_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_AO_s1_in_a_write_cycle;

  assign wait_for_lcd_AO_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_AO/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_cs_n_s1_arbitrator (
                                // inputs:
                                 clk,
                                 nios_fast_data_master_address_to_slave,
                                 nios_fast_data_master_latency_counter,
                                 nios_fast_data_master_read,
                                 nios_fast_data_master_write,
                                 nios_fast_data_master_writedata,
                                 reset_n,

                                // outputs:
                                 d1_lcd_cs_n_s1_end_xfer,
                                 lcd_cs_n_s1_address,
                                 lcd_cs_n_s1_chipselect,
                                 lcd_cs_n_s1_reset_n,
                                 lcd_cs_n_s1_write_n,
                                 lcd_cs_n_s1_writedata,
                                 nios_fast_data_master_granted_lcd_cs_n_s1,
                                 nios_fast_data_master_qualified_request_lcd_cs_n_s1,
                                 nios_fast_data_master_read_data_valid_lcd_cs_n_s1,
                                 nios_fast_data_master_requests_lcd_cs_n_s1
                              )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_lcd_cs_n_s1_end_xfer;
  output  [  1: 0] lcd_cs_n_s1_address;
  output           lcd_cs_n_s1_chipselect;
  output           lcd_cs_n_s1_reset_n;
  output           lcd_cs_n_s1_write_n;
  output           lcd_cs_n_s1_writedata;
  output           nios_fast_data_master_granted_lcd_cs_n_s1;
  output           nios_fast_data_master_qualified_request_lcd_cs_n_s1;
  output           nios_fast_data_master_read_data_valid_lcd_cs_n_s1;
  output           nios_fast_data_master_requests_lcd_cs_n_s1;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;

  reg              d1_lcd_cs_n_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_cs_n_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_cs_n_s1_address;
  wire             lcd_cs_n_s1_allgrants;
  wire             lcd_cs_n_s1_allow_new_arb_cycle;
  wire             lcd_cs_n_s1_any_bursting_master_saved_grant;
  wire             lcd_cs_n_s1_any_continuerequest;
  wire             lcd_cs_n_s1_arb_counter_enable;
  reg     [  2: 0] lcd_cs_n_s1_arb_share_counter;
  wire    [  2: 0] lcd_cs_n_s1_arb_share_counter_next_value;
  wire    [  2: 0] lcd_cs_n_s1_arb_share_set_values;
  wire             lcd_cs_n_s1_beginbursttransfer_internal;
  wire             lcd_cs_n_s1_begins_xfer;
  wire             lcd_cs_n_s1_chipselect;
  wire             lcd_cs_n_s1_end_xfer;
  wire             lcd_cs_n_s1_firsttransfer;
  wire             lcd_cs_n_s1_grant_vector;
  wire             lcd_cs_n_s1_in_a_read_cycle;
  wire             lcd_cs_n_s1_in_a_write_cycle;
  wire             lcd_cs_n_s1_master_qreq_vector;
  wire             lcd_cs_n_s1_non_bursting_master_requests;
  reg              lcd_cs_n_s1_reg_firsttransfer;
  wire             lcd_cs_n_s1_reset_n;
  reg              lcd_cs_n_s1_slavearbiterlockenable;
  wire             lcd_cs_n_s1_slavearbiterlockenable2;
  wire             lcd_cs_n_s1_unreg_firsttransfer;
  wire             lcd_cs_n_s1_waits_for_read;
  wire             lcd_cs_n_s1_waits_for_write;
  wire             lcd_cs_n_s1_write_n;
  wire             lcd_cs_n_s1_writedata;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_lcd_cs_n_s1;
  wire             nios_fast_data_master_qualified_request_lcd_cs_n_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_cs_n_s1;
  wire             nios_fast_data_master_requests_lcd_cs_n_s1;
  wire             nios_fast_data_master_saved_grant_lcd_cs_n_s1;
  wire    [ 23: 0] shifted_address_to_lcd_cs_n_s1_from_nios_fast_data_master;
  wire             wait_for_lcd_cs_n_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~lcd_cs_n_s1_end_xfer;
    end


  assign lcd_cs_n_s1_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_lcd_cs_n_s1));
  assign nios_fast_data_master_requests_lcd_cs_n_s1 = (({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h902060) & (nios_fast_data_master_read | nios_fast_data_master_write)) & nios_fast_data_master_write;
  //lcd_cs_n_s1_arb_share_counter set values, which is an e_mux
  assign lcd_cs_n_s1_arb_share_set_values = 1;

  //lcd_cs_n_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_cs_n_s1_non_bursting_master_requests = nios_fast_data_master_requests_lcd_cs_n_s1;

  //lcd_cs_n_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_cs_n_s1_any_bursting_master_saved_grant = 0;

  //lcd_cs_n_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_cs_n_s1_arb_share_counter_next_value = lcd_cs_n_s1_firsttransfer ? (lcd_cs_n_s1_arb_share_set_values - 1) : |lcd_cs_n_s1_arb_share_counter ? (lcd_cs_n_s1_arb_share_counter - 1) : 0;

  //lcd_cs_n_s1_allgrants all slave grants, which is an e_mux
  assign lcd_cs_n_s1_allgrants = |lcd_cs_n_s1_grant_vector;

  //lcd_cs_n_s1_end_xfer assignment, which is an e_assign
  assign lcd_cs_n_s1_end_xfer = ~(lcd_cs_n_s1_waits_for_read | lcd_cs_n_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_cs_n_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_cs_n_s1 = lcd_cs_n_s1_end_xfer & (~lcd_cs_n_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_cs_n_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_cs_n_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_cs_n_s1 & lcd_cs_n_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_cs_n_s1 & ~lcd_cs_n_s1_non_bursting_master_requests);

  //lcd_cs_n_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_cs_n_s1_arb_share_counter <= 0;
      else if (lcd_cs_n_s1_arb_counter_enable)
          lcd_cs_n_s1_arb_share_counter <= lcd_cs_n_s1_arb_share_counter_next_value;
    end


  //lcd_cs_n_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_cs_n_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_cs_n_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_cs_n_s1) | (end_xfer_arb_share_counter_term_lcd_cs_n_s1 & ~lcd_cs_n_s1_non_bursting_master_requests))
          lcd_cs_n_s1_slavearbiterlockenable <= |lcd_cs_n_s1_arb_share_counter_next_value;
    end


  //nios_fast/data_master lcd_cs_n/s1 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = lcd_cs_n_s1_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //lcd_cs_n_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_cs_n_s1_slavearbiterlockenable2 = |lcd_cs_n_s1_arb_share_counter_next_value;

  //nios_fast/data_master lcd_cs_n/s1 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = lcd_cs_n_s1_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //lcd_cs_n_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_cs_n_s1_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_lcd_cs_n_s1 = nios_fast_data_master_requests_lcd_cs_n_s1;
  //local readdatavalid nios_fast_data_master_read_data_valid_lcd_cs_n_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_lcd_cs_n_s1 = nios_fast_data_master_granted_lcd_cs_n_s1 & nios_fast_data_master_read & ~lcd_cs_n_s1_waits_for_read;

  //lcd_cs_n_s1_writedata mux, which is an e_mux
  assign lcd_cs_n_s1_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_lcd_cs_n_s1 = nios_fast_data_master_qualified_request_lcd_cs_n_s1;

  //nios_fast/data_master saved-grant lcd_cs_n/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_lcd_cs_n_s1 = nios_fast_data_master_requests_lcd_cs_n_s1;

  //allow new arb cycle for lcd_cs_n/s1, which is an e_assign
  assign lcd_cs_n_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_cs_n_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_cs_n_s1_master_qreq_vector = 1;

  //lcd_cs_n_s1_reset_n assignment, which is an e_assign
  assign lcd_cs_n_s1_reset_n = reset_n;

  assign lcd_cs_n_s1_chipselect = nios_fast_data_master_granted_lcd_cs_n_s1;
  //lcd_cs_n_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_cs_n_s1_firsttransfer = lcd_cs_n_s1_begins_xfer ? lcd_cs_n_s1_unreg_firsttransfer : lcd_cs_n_s1_reg_firsttransfer;

  //lcd_cs_n_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_cs_n_s1_unreg_firsttransfer = ~(lcd_cs_n_s1_slavearbiterlockenable & lcd_cs_n_s1_any_continuerequest);

  //lcd_cs_n_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_cs_n_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_cs_n_s1_begins_xfer)
          lcd_cs_n_s1_reg_firsttransfer <= lcd_cs_n_s1_unreg_firsttransfer;
    end


  //lcd_cs_n_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_cs_n_s1_beginbursttransfer_internal = lcd_cs_n_s1_begins_xfer;

  //~lcd_cs_n_s1_write_n assignment, which is an e_mux
  assign lcd_cs_n_s1_write_n = ~(nios_fast_data_master_granted_lcd_cs_n_s1 & nios_fast_data_master_write);

  assign shifted_address_to_lcd_cs_n_s1_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //lcd_cs_n_s1_address mux, which is an e_mux
  assign lcd_cs_n_s1_address = shifted_address_to_lcd_cs_n_s1_from_nios_fast_data_master >> 2;

  //d1_lcd_cs_n_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_cs_n_s1_end_xfer <= 1;
      else if (1)
          d1_lcd_cs_n_s1_end_xfer <= lcd_cs_n_s1_end_xfer;
    end


  //lcd_cs_n_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_cs_n_s1_waits_for_read = lcd_cs_n_s1_in_a_read_cycle & lcd_cs_n_s1_begins_xfer;

  //lcd_cs_n_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_cs_n_s1_in_a_read_cycle = nios_fast_data_master_granted_lcd_cs_n_s1 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_cs_n_s1_in_a_read_cycle;

  //lcd_cs_n_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_cs_n_s1_waits_for_write = lcd_cs_n_s1_in_a_write_cycle & 0;

  //lcd_cs_n_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_cs_n_s1_in_a_write_cycle = nios_fast_data_master_granted_lcd_cs_n_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_cs_n_s1_in_a_write_cycle;

  assign wait_for_lcd_cs_n_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_cs_n/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_rst_n_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  nios_fast_data_master_address_to_slave,
                                  nios_fast_data_master_latency_counter,
                                  nios_fast_data_master_read,
                                  nios_fast_data_master_write,
                                  nios_fast_data_master_writedata,
                                  reset_n,

                                 // outputs:
                                  d1_lcd_rst_n_s1_end_xfer,
                                  lcd_rst_n_s1_address,
                                  lcd_rst_n_s1_chipselect,
                                  lcd_rst_n_s1_reset_n,
                                  lcd_rst_n_s1_write_n,
                                  lcd_rst_n_s1_writedata,
                                  nios_fast_data_master_granted_lcd_rst_n_s1,
                                  nios_fast_data_master_qualified_request_lcd_rst_n_s1,
                                  nios_fast_data_master_read_data_valid_lcd_rst_n_s1,
                                  nios_fast_data_master_requests_lcd_rst_n_s1
                               )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_lcd_rst_n_s1_end_xfer;
  output  [  1: 0] lcd_rst_n_s1_address;
  output           lcd_rst_n_s1_chipselect;
  output           lcd_rst_n_s1_reset_n;
  output           lcd_rst_n_s1_write_n;
  output           lcd_rst_n_s1_writedata;
  output           nios_fast_data_master_granted_lcd_rst_n_s1;
  output           nios_fast_data_master_qualified_request_lcd_rst_n_s1;
  output           nios_fast_data_master_read_data_valid_lcd_rst_n_s1;
  output           nios_fast_data_master_requests_lcd_rst_n_s1;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;

  reg              d1_lcd_rst_n_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_rst_n_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_rst_n_s1_address;
  wire             lcd_rst_n_s1_allgrants;
  wire             lcd_rst_n_s1_allow_new_arb_cycle;
  wire             lcd_rst_n_s1_any_bursting_master_saved_grant;
  wire             lcd_rst_n_s1_any_continuerequest;
  wire             lcd_rst_n_s1_arb_counter_enable;
  reg     [  2: 0] lcd_rst_n_s1_arb_share_counter;
  wire    [  2: 0] lcd_rst_n_s1_arb_share_counter_next_value;
  wire    [  2: 0] lcd_rst_n_s1_arb_share_set_values;
  wire             lcd_rst_n_s1_beginbursttransfer_internal;
  wire             lcd_rst_n_s1_begins_xfer;
  wire             lcd_rst_n_s1_chipselect;
  wire             lcd_rst_n_s1_end_xfer;
  wire             lcd_rst_n_s1_firsttransfer;
  wire             lcd_rst_n_s1_grant_vector;
  wire             lcd_rst_n_s1_in_a_read_cycle;
  wire             lcd_rst_n_s1_in_a_write_cycle;
  wire             lcd_rst_n_s1_master_qreq_vector;
  wire             lcd_rst_n_s1_non_bursting_master_requests;
  reg              lcd_rst_n_s1_reg_firsttransfer;
  wire             lcd_rst_n_s1_reset_n;
  reg              lcd_rst_n_s1_slavearbiterlockenable;
  wire             lcd_rst_n_s1_slavearbiterlockenable2;
  wire             lcd_rst_n_s1_unreg_firsttransfer;
  wire             lcd_rst_n_s1_waits_for_read;
  wire             lcd_rst_n_s1_waits_for_write;
  wire             lcd_rst_n_s1_write_n;
  wire             lcd_rst_n_s1_writedata;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_lcd_rst_n_s1;
  wire             nios_fast_data_master_qualified_request_lcd_rst_n_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_rst_n_s1;
  wire             nios_fast_data_master_requests_lcd_rst_n_s1;
  wire             nios_fast_data_master_saved_grant_lcd_rst_n_s1;
  wire    [ 23: 0] shifted_address_to_lcd_rst_n_s1_from_nios_fast_data_master;
  wire             wait_for_lcd_rst_n_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~lcd_rst_n_s1_end_xfer;
    end


  assign lcd_rst_n_s1_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_lcd_rst_n_s1));
  assign nios_fast_data_master_requests_lcd_rst_n_s1 = (({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h902050) & (nios_fast_data_master_read | nios_fast_data_master_write)) & nios_fast_data_master_write;
  //lcd_rst_n_s1_arb_share_counter set values, which is an e_mux
  assign lcd_rst_n_s1_arb_share_set_values = 1;

  //lcd_rst_n_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_rst_n_s1_non_bursting_master_requests = nios_fast_data_master_requests_lcd_rst_n_s1;

  //lcd_rst_n_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_rst_n_s1_any_bursting_master_saved_grant = 0;

  //lcd_rst_n_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_rst_n_s1_arb_share_counter_next_value = lcd_rst_n_s1_firsttransfer ? (lcd_rst_n_s1_arb_share_set_values - 1) : |lcd_rst_n_s1_arb_share_counter ? (lcd_rst_n_s1_arb_share_counter - 1) : 0;

  //lcd_rst_n_s1_allgrants all slave grants, which is an e_mux
  assign lcd_rst_n_s1_allgrants = |lcd_rst_n_s1_grant_vector;

  //lcd_rst_n_s1_end_xfer assignment, which is an e_assign
  assign lcd_rst_n_s1_end_xfer = ~(lcd_rst_n_s1_waits_for_read | lcd_rst_n_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_rst_n_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_rst_n_s1 = lcd_rst_n_s1_end_xfer & (~lcd_rst_n_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_rst_n_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_rst_n_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_rst_n_s1 & lcd_rst_n_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_rst_n_s1 & ~lcd_rst_n_s1_non_bursting_master_requests);

  //lcd_rst_n_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_rst_n_s1_arb_share_counter <= 0;
      else if (lcd_rst_n_s1_arb_counter_enable)
          lcd_rst_n_s1_arb_share_counter <= lcd_rst_n_s1_arb_share_counter_next_value;
    end


  //lcd_rst_n_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_rst_n_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_rst_n_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_rst_n_s1) | (end_xfer_arb_share_counter_term_lcd_rst_n_s1 & ~lcd_rst_n_s1_non_bursting_master_requests))
          lcd_rst_n_s1_slavearbiterlockenable <= |lcd_rst_n_s1_arb_share_counter_next_value;
    end


  //nios_fast/data_master lcd_rst_n/s1 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = lcd_rst_n_s1_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //lcd_rst_n_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_rst_n_s1_slavearbiterlockenable2 = |lcd_rst_n_s1_arb_share_counter_next_value;

  //nios_fast/data_master lcd_rst_n/s1 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = lcd_rst_n_s1_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //lcd_rst_n_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_rst_n_s1_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_lcd_rst_n_s1 = nios_fast_data_master_requests_lcd_rst_n_s1;
  //local readdatavalid nios_fast_data_master_read_data_valid_lcd_rst_n_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_lcd_rst_n_s1 = nios_fast_data_master_granted_lcd_rst_n_s1 & nios_fast_data_master_read & ~lcd_rst_n_s1_waits_for_read;

  //lcd_rst_n_s1_writedata mux, which is an e_mux
  assign lcd_rst_n_s1_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_lcd_rst_n_s1 = nios_fast_data_master_qualified_request_lcd_rst_n_s1;

  //nios_fast/data_master saved-grant lcd_rst_n/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_lcd_rst_n_s1 = nios_fast_data_master_requests_lcd_rst_n_s1;

  //allow new arb cycle for lcd_rst_n/s1, which is an e_assign
  assign lcd_rst_n_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_rst_n_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_rst_n_s1_master_qreq_vector = 1;

  //lcd_rst_n_s1_reset_n assignment, which is an e_assign
  assign lcd_rst_n_s1_reset_n = reset_n;

  assign lcd_rst_n_s1_chipselect = nios_fast_data_master_granted_lcd_rst_n_s1;
  //lcd_rst_n_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_rst_n_s1_firsttransfer = lcd_rst_n_s1_begins_xfer ? lcd_rst_n_s1_unreg_firsttransfer : lcd_rst_n_s1_reg_firsttransfer;

  //lcd_rst_n_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_rst_n_s1_unreg_firsttransfer = ~(lcd_rst_n_s1_slavearbiterlockenable & lcd_rst_n_s1_any_continuerequest);

  //lcd_rst_n_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_rst_n_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_rst_n_s1_begins_xfer)
          lcd_rst_n_s1_reg_firsttransfer <= lcd_rst_n_s1_unreg_firsttransfer;
    end


  //lcd_rst_n_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_rst_n_s1_beginbursttransfer_internal = lcd_rst_n_s1_begins_xfer;

  //~lcd_rst_n_s1_write_n assignment, which is an e_mux
  assign lcd_rst_n_s1_write_n = ~(nios_fast_data_master_granted_lcd_rst_n_s1 & nios_fast_data_master_write);

  assign shifted_address_to_lcd_rst_n_s1_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //lcd_rst_n_s1_address mux, which is an e_mux
  assign lcd_rst_n_s1_address = shifted_address_to_lcd_rst_n_s1_from_nios_fast_data_master >> 2;

  //d1_lcd_rst_n_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_rst_n_s1_end_xfer <= 1;
      else if (1)
          d1_lcd_rst_n_s1_end_xfer <= lcd_rst_n_s1_end_xfer;
    end


  //lcd_rst_n_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_rst_n_s1_waits_for_read = lcd_rst_n_s1_in_a_read_cycle & lcd_rst_n_s1_begins_xfer;

  //lcd_rst_n_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_rst_n_s1_in_a_read_cycle = nios_fast_data_master_granted_lcd_rst_n_s1 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_rst_n_s1_in_a_read_cycle;

  //lcd_rst_n_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_rst_n_s1_waits_for_write = lcd_rst_n_s1_in_a_write_cycle & 0;

  //lcd_rst_n_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_rst_n_s1_in_a_write_cycle = nios_fast_data_master_granted_lcd_rst_n_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_rst_n_s1_in_a_write_cycle;

  assign wait_for_lcd_rst_n_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_rst_n/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_sck_s1_arbitrator (
                               // inputs:
                                clk,
                                nios_fast_data_master_address_to_slave,
                                nios_fast_data_master_latency_counter,
                                nios_fast_data_master_read,
                                nios_fast_data_master_write,
                                nios_fast_data_master_writedata,
                                reset_n,

                               // outputs:
                                d1_lcd_sck_s1_end_xfer,
                                lcd_sck_s1_address,
                                lcd_sck_s1_chipselect,
                                lcd_sck_s1_reset_n,
                                lcd_sck_s1_write_n,
                                lcd_sck_s1_writedata,
                                nios_fast_data_master_granted_lcd_sck_s1,
                                nios_fast_data_master_qualified_request_lcd_sck_s1,
                                nios_fast_data_master_read_data_valid_lcd_sck_s1,
                                nios_fast_data_master_requests_lcd_sck_s1
                             )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_lcd_sck_s1_end_xfer;
  output  [  1: 0] lcd_sck_s1_address;
  output           lcd_sck_s1_chipselect;
  output           lcd_sck_s1_reset_n;
  output           lcd_sck_s1_write_n;
  output           lcd_sck_s1_writedata;
  output           nios_fast_data_master_granted_lcd_sck_s1;
  output           nios_fast_data_master_qualified_request_lcd_sck_s1;
  output           nios_fast_data_master_read_data_valid_lcd_sck_s1;
  output           nios_fast_data_master_requests_lcd_sck_s1;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;

  reg              d1_lcd_sck_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_sck_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_sck_s1_address;
  wire             lcd_sck_s1_allgrants;
  wire             lcd_sck_s1_allow_new_arb_cycle;
  wire             lcd_sck_s1_any_bursting_master_saved_grant;
  wire             lcd_sck_s1_any_continuerequest;
  wire             lcd_sck_s1_arb_counter_enable;
  reg     [  2: 0] lcd_sck_s1_arb_share_counter;
  wire    [  2: 0] lcd_sck_s1_arb_share_counter_next_value;
  wire    [  2: 0] lcd_sck_s1_arb_share_set_values;
  wire             lcd_sck_s1_beginbursttransfer_internal;
  wire             lcd_sck_s1_begins_xfer;
  wire             lcd_sck_s1_chipselect;
  wire             lcd_sck_s1_end_xfer;
  wire             lcd_sck_s1_firsttransfer;
  wire             lcd_sck_s1_grant_vector;
  wire             lcd_sck_s1_in_a_read_cycle;
  wire             lcd_sck_s1_in_a_write_cycle;
  wire             lcd_sck_s1_master_qreq_vector;
  wire             lcd_sck_s1_non_bursting_master_requests;
  reg              lcd_sck_s1_reg_firsttransfer;
  wire             lcd_sck_s1_reset_n;
  reg              lcd_sck_s1_slavearbiterlockenable;
  wire             lcd_sck_s1_slavearbiterlockenable2;
  wire             lcd_sck_s1_unreg_firsttransfer;
  wire             lcd_sck_s1_waits_for_read;
  wire             lcd_sck_s1_waits_for_write;
  wire             lcd_sck_s1_write_n;
  wire             lcd_sck_s1_writedata;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_lcd_sck_s1;
  wire             nios_fast_data_master_qualified_request_lcd_sck_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_sck_s1;
  wire             nios_fast_data_master_requests_lcd_sck_s1;
  wire             nios_fast_data_master_saved_grant_lcd_sck_s1;
  wire    [ 23: 0] shifted_address_to_lcd_sck_s1_from_nios_fast_data_master;
  wire             wait_for_lcd_sck_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~lcd_sck_s1_end_xfer;
    end


  assign lcd_sck_s1_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_lcd_sck_s1));
  assign nios_fast_data_master_requests_lcd_sck_s1 = (({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h902070) & (nios_fast_data_master_read | nios_fast_data_master_write)) & nios_fast_data_master_write;
  //lcd_sck_s1_arb_share_counter set values, which is an e_mux
  assign lcd_sck_s1_arb_share_set_values = 1;

  //lcd_sck_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_sck_s1_non_bursting_master_requests = nios_fast_data_master_requests_lcd_sck_s1;

  //lcd_sck_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_sck_s1_any_bursting_master_saved_grant = 0;

  //lcd_sck_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_sck_s1_arb_share_counter_next_value = lcd_sck_s1_firsttransfer ? (lcd_sck_s1_arb_share_set_values - 1) : |lcd_sck_s1_arb_share_counter ? (lcd_sck_s1_arb_share_counter - 1) : 0;

  //lcd_sck_s1_allgrants all slave grants, which is an e_mux
  assign lcd_sck_s1_allgrants = |lcd_sck_s1_grant_vector;

  //lcd_sck_s1_end_xfer assignment, which is an e_assign
  assign lcd_sck_s1_end_xfer = ~(lcd_sck_s1_waits_for_read | lcd_sck_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_sck_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_sck_s1 = lcd_sck_s1_end_xfer & (~lcd_sck_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_sck_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_sck_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_sck_s1 & lcd_sck_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_sck_s1 & ~lcd_sck_s1_non_bursting_master_requests);

  //lcd_sck_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_sck_s1_arb_share_counter <= 0;
      else if (lcd_sck_s1_arb_counter_enable)
          lcd_sck_s1_arb_share_counter <= lcd_sck_s1_arb_share_counter_next_value;
    end


  //lcd_sck_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_sck_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_sck_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_sck_s1) | (end_xfer_arb_share_counter_term_lcd_sck_s1 & ~lcd_sck_s1_non_bursting_master_requests))
          lcd_sck_s1_slavearbiterlockenable <= |lcd_sck_s1_arb_share_counter_next_value;
    end


  //nios_fast/data_master lcd_sck/s1 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = lcd_sck_s1_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //lcd_sck_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_sck_s1_slavearbiterlockenable2 = |lcd_sck_s1_arb_share_counter_next_value;

  //nios_fast/data_master lcd_sck/s1 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = lcd_sck_s1_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //lcd_sck_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_sck_s1_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_lcd_sck_s1 = nios_fast_data_master_requests_lcd_sck_s1;
  //local readdatavalid nios_fast_data_master_read_data_valid_lcd_sck_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_lcd_sck_s1 = nios_fast_data_master_granted_lcd_sck_s1 & nios_fast_data_master_read & ~lcd_sck_s1_waits_for_read;

  //lcd_sck_s1_writedata mux, which is an e_mux
  assign lcd_sck_s1_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_lcd_sck_s1 = nios_fast_data_master_qualified_request_lcd_sck_s1;

  //nios_fast/data_master saved-grant lcd_sck/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_lcd_sck_s1 = nios_fast_data_master_requests_lcd_sck_s1;

  //allow new arb cycle for lcd_sck/s1, which is an e_assign
  assign lcd_sck_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_sck_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_sck_s1_master_qreq_vector = 1;

  //lcd_sck_s1_reset_n assignment, which is an e_assign
  assign lcd_sck_s1_reset_n = reset_n;

  assign lcd_sck_s1_chipselect = nios_fast_data_master_granted_lcd_sck_s1;
  //lcd_sck_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_sck_s1_firsttransfer = lcd_sck_s1_begins_xfer ? lcd_sck_s1_unreg_firsttransfer : lcd_sck_s1_reg_firsttransfer;

  //lcd_sck_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_sck_s1_unreg_firsttransfer = ~(lcd_sck_s1_slavearbiterlockenable & lcd_sck_s1_any_continuerequest);

  //lcd_sck_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_sck_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_sck_s1_begins_xfer)
          lcd_sck_s1_reg_firsttransfer <= lcd_sck_s1_unreg_firsttransfer;
    end


  //lcd_sck_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_sck_s1_beginbursttransfer_internal = lcd_sck_s1_begins_xfer;

  //~lcd_sck_s1_write_n assignment, which is an e_mux
  assign lcd_sck_s1_write_n = ~(nios_fast_data_master_granted_lcd_sck_s1 & nios_fast_data_master_write);

  assign shifted_address_to_lcd_sck_s1_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //lcd_sck_s1_address mux, which is an e_mux
  assign lcd_sck_s1_address = shifted_address_to_lcd_sck_s1_from_nios_fast_data_master >> 2;

  //d1_lcd_sck_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_sck_s1_end_xfer <= 1;
      else if (1)
          d1_lcd_sck_s1_end_xfer <= lcd_sck_s1_end_xfer;
    end


  //lcd_sck_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_sck_s1_waits_for_read = lcd_sck_s1_in_a_read_cycle & lcd_sck_s1_begins_xfer;

  //lcd_sck_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_sck_s1_in_a_read_cycle = nios_fast_data_master_granted_lcd_sck_s1 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_sck_s1_in_a_read_cycle;

  //lcd_sck_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_sck_s1_waits_for_write = lcd_sck_s1_in_a_write_cycle & 0;

  //lcd_sck_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_sck_s1_in_a_write_cycle = nios_fast_data_master_granted_lcd_sck_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_sck_s1_in_a_write_cycle;

  assign wait_for_lcd_sck_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_sck/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_si_s1_arbitrator (
                              // inputs:
                               clk,
                               nios_fast_data_master_address_to_slave,
                               nios_fast_data_master_latency_counter,
                               nios_fast_data_master_read,
                               nios_fast_data_master_write,
                               nios_fast_data_master_writedata,
                               reset_n,

                              // outputs:
                               d1_lcd_si_s1_end_xfer,
                               lcd_si_s1_address,
                               lcd_si_s1_chipselect,
                               lcd_si_s1_reset_n,
                               lcd_si_s1_write_n,
                               lcd_si_s1_writedata,
                               nios_fast_data_master_granted_lcd_si_s1,
                               nios_fast_data_master_qualified_request_lcd_si_s1,
                               nios_fast_data_master_read_data_valid_lcd_si_s1,
                               nios_fast_data_master_requests_lcd_si_s1
                            )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_lcd_si_s1_end_xfer;
  output  [  1: 0] lcd_si_s1_address;
  output           lcd_si_s1_chipselect;
  output           lcd_si_s1_reset_n;
  output           lcd_si_s1_write_n;
  output           lcd_si_s1_writedata;
  output           nios_fast_data_master_granted_lcd_si_s1;
  output           nios_fast_data_master_qualified_request_lcd_si_s1;
  output           nios_fast_data_master_read_data_valid_lcd_si_s1;
  output           nios_fast_data_master_requests_lcd_si_s1;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;

  reg              d1_lcd_si_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_si_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_si_s1_address;
  wire             lcd_si_s1_allgrants;
  wire             lcd_si_s1_allow_new_arb_cycle;
  wire             lcd_si_s1_any_bursting_master_saved_grant;
  wire             lcd_si_s1_any_continuerequest;
  wire             lcd_si_s1_arb_counter_enable;
  reg     [  2: 0] lcd_si_s1_arb_share_counter;
  wire    [  2: 0] lcd_si_s1_arb_share_counter_next_value;
  wire    [  2: 0] lcd_si_s1_arb_share_set_values;
  wire             lcd_si_s1_beginbursttransfer_internal;
  wire             lcd_si_s1_begins_xfer;
  wire             lcd_si_s1_chipselect;
  wire             lcd_si_s1_end_xfer;
  wire             lcd_si_s1_firsttransfer;
  wire             lcd_si_s1_grant_vector;
  wire             lcd_si_s1_in_a_read_cycle;
  wire             lcd_si_s1_in_a_write_cycle;
  wire             lcd_si_s1_master_qreq_vector;
  wire             lcd_si_s1_non_bursting_master_requests;
  reg              lcd_si_s1_reg_firsttransfer;
  wire             lcd_si_s1_reset_n;
  reg              lcd_si_s1_slavearbiterlockenable;
  wire             lcd_si_s1_slavearbiterlockenable2;
  wire             lcd_si_s1_unreg_firsttransfer;
  wire             lcd_si_s1_waits_for_read;
  wire             lcd_si_s1_waits_for_write;
  wire             lcd_si_s1_write_n;
  wire             lcd_si_s1_writedata;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_lcd_si_s1;
  wire             nios_fast_data_master_qualified_request_lcd_si_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_si_s1;
  wire             nios_fast_data_master_requests_lcd_si_s1;
  wire             nios_fast_data_master_saved_grant_lcd_si_s1;
  wire    [ 23: 0] shifted_address_to_lcd_si_s1_from_nios_fast_data_master;
  wire             wait_for_lcd_si_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~lcd_si_s1_end_xfer;
    end


  assign lcd_si_s1_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_lcd_si_s1));
  assign nios_fast_data_master_requests_lcd_si_s1 = (({nios_fast_data_master_address_to_slave[23 : 4] , 4'b0} == 24'h902080) & (nios_fast_data_master_read | nios_fast_data_master_write)) & nios_fast_data_master_write;
  //lcd_si_s1_arb_share_counter set values, which is an e_mux
  assign lcd_si_s1_arb_share_set_values = 1;

  //lcd_si_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_si_s1_non_bursting_master_requests = nios_fast_data_master_requests_lcd_si_s1;

  //lcd_si_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_si_s1_any_bursting_master_saved_grant = 0;

  //lcd_si_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_si_s1_arb_share_counter_next_value = lcd_si_s1_firsttransfer ? (lcd_si_s1_arb_share_set_values - 1) : |lcd_si_s1_arb_share_counter ? (lcd_si_s1_arb_share_counter - 1) : 0;

  //lcd_si_s1_allgrants all slave grants, which is an e_mux
  assign lcd_si_s1_allgrants = |lcd_si_s1_grant_vector;

  //lcd_si_s1_end_xfer assignment, which is an e_assign
  assign lcd_si_s1_end_xfer = ~(lcd_si_s1_waits_for_read | lcd_si_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_si_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_si_s1 = lcd_si_s1_end_xfer & (~lcd_si_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_si_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_si_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_si_s1 & lcd_si_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_si_s1 & ~lcd_si_s1_non_bursting_master_requests);

  //lcd_si_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_si_s1_arb_share_counter <= 0;
      else if (lcd_si_s1_arb_counter_enable)
          lcd_si_s1_arb_share_counter <= lcd_si_s1_arb_share_counter_next_value;
    end


  //lcd_si_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_si_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_si_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_si_s1) | (end_xfer_arb_share_counter_term_lcd_si_s1 & ~lcd_si_s1_non_bursting_master_requests))
          lcd_si_s1_slavearbiterlockenable <= |lcd_si_s1_arb_share_counter_next_value;
    end


  //nios_fast/data_master lcd_si/s1 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = lcd_si_s1_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //lcd_si_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_si_s1_slavearbiterlockenable2 = |lcd_si_s1_arb_share_counter_next_value;

  //nios_fast/data_master lcd_si/s1 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = lcd_si_s1_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //lcd_si_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_si_s1_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_lcd_si_s1 = nios_fast_data_master_requests_lcd_si_s1;
  //local readdatavalid nios_fast_data_master_read_data_valid_lcd_si_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_lcd_si_s1 = nios_fast_data_master_granted_lcd_si_s1 & nios_fast_data_master_read & ~lcd_si_s1_waits_for_read;

  //lcd_si_s1_writedata mux, which is an e_mux
  assign lcd_si_s1_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_lcd_si_s1 = nios_fast_data_master_qualified_request_lcd_si_s1;

  //nios_fast/data_master saved-grant lcd_si/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_lcd_si_s1 = nios_fast_data_master_requests_lcd_si_s1;

  //allow new arb cycle for lcd_si/s1, which is an e_assign
  assign lcd_si_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_si_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_si_s1_master_qreq_vector = 1;

  //lcd_si_s1_reset_n assignment, which is an e_assign
  assign lcd_si_s1_reset_n = reset_n;

  assign lcd_si_s1_chipselect = nios_fast_data_master_granted_lcd_si_s1;
  //lcd_si_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_si_s1_firsttransfer = lcd_si_s1_begins_xfer ? lcd_si_s1_unreg_firsttransfer : lcd_si_s1_reg_firsttransfer;

  //lcd_si_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_si_s1_unreg_firsttransfer = ~(lcd_si_s1_slavearbiterlockenable & lcd_si_s1_any_continuerequest);

  //lcd_si_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_si_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_si_s1_begins_xfer)
          lcd_si_s1_reg_firsttransfer <= lcd_si_s1_unreg_firsttransfer;
    end


  //lcd_si_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_si_s1_beginbursttransfer_internal = lcd_si_s1_begins_xfer;

  //~lcd_si_s1_write_n assignment, which is an e_mux
  assign lcd_si_s1_write_n = ~(nios_fast_data_master_granted_lcd_si_s1 & nios_fast_data_master_write);

  assign shifted_address_to_lcd_si_s1_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //lcd_si_s1_address mux, which is an e_mux
  assign lcd_si_s1_address = shifted_address_to_lcd_si_s1_from_nios_fast_data_master >> 2;

  //d1_lcd_si_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_si_s1_end_xfer <= 1;
      else if (1)
          d1_lcd_si_s1_end_xfer <= lcd_si_s1_end_xfer;
    end


  //lcd_si_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_si_s1_waits_for_read = lcd_si_s1_in_a_read_cycle & lcd_si_s1_begins_xfer;

  //lcd_si_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_si_s1_in_a_read_cycle = nios_fast_data_master_granted_lcd_si_s1 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_si_s1_in_a_read_cycle;

  //lcd_si_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_si_s1_waits_for_write = lcd_si_s1_in_a_write_cycle & 0;

  //lcd_si_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_si_s1_in_a_write_cycle = nios_fast_data_master_granted_lcd_si_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_si_s1_in_a_write_cycle;

  assign wait_for_lcd_si_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_si/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_fast_jtag_debug_module_arbitrator (
                                                // inputs:
                                                 clk,
                                                 nios_fast_data_master_address_to_slave,
                                                 nios_fast_data_master_byteenable,
                                                 nios_fast_data_master_debugaccess,
                                                 nios_fast_data_master_latency_counter,
                                                 nios_fast_data_master_read,
                                                 nios_fast_data_master_write,
                                                 nios_fast_data_master_writedata,
                                                 nios_fast_instruction_master_address_to_slave,
                                                 nios_fast_instruction_master_latency_counter,
                                                 nios_fast_instruction_master_read,
                                                 nios_fast_jtag_debug_module_readdata,
                                                 nios_fast_jtag_debug_module_resetrequest,
                                                 reset_n,

                                                // outputs:
                                                 d1_nios_fast_jtag_debug_module_end_xfer,
                                                 nios_fast_data_master_granted_nios_fast_jtag_debug_module,
                                                 nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module,
                                                 nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module,
                                                 nios_fast_data_master_requests_nios_fast_jtag_debug_module,
                                                 nios_fast_instruction_master_granted_nios_fast_jtag_debug_module,
                                                 nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module,
                                                 nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module,
                                                 nios_fast_instruction_master_requests_nios_fast_jtag_debug_module,
                                                 nios_fast_jtag_debug_module_address,
                                                 nios_fast_jtag_debug_module_begintransfer,
                                                 nios_fast_jtag_debug_module_byteenable,
                                                 nios_fast_jtag_debug_module_chipselect,
                                                 nios_fast_jtag_debug_module_debugaccess,
                                                 nios_fast_jtag_debug_module_readdata_from_sa,
                                                 nios_fast_jtag_debug_module_reset,
                                                 nios_fast_jtag_debug_module_reset_n,
                                                 nios_fast_jtag_debug_module_resetrequest_from_sa,
                                                 nios_fast_jtag_debug_module_write,
                                                 nios_fast_jtag_debug_module_writedata
                                              )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_nios_fast_jtag_debug_module_end_xfer;
  output           nios_fast_data_master_granted_nios_fast_jtag_debug_module;
  output           nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module;
  output           nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module;
  output           nios_fast_data_master_requests_nios_fast_jtag_debug_module;
  output           nios_fast_instruction_master_granted_nios_fast_jtag_debug_module;
  output           nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module;
  output           nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module;
  output           nios_fast_instruction_master_requests_nios_fast_jtag_debug_module;
  output  [  8: 0] nios_fast_jtag_debug_module_address;
  output           nios_fast_jtag_debug_module_begintransfer;
  output  [  3: 0] nios_fast_jtag_debug_module_byteenable;
  output           nios_fast_jtag_debug_module_chipselect;
  output           nios_fast_jtag_debug_module_debugaccess;
  output  [ 31: 0] nios_fast_jtag_debug_module_readdata_from_sa;
  output           nios_fast_jtag_debug_module_reset;
  output           nios_fast_jtag_debug_module_reset_n;
  output           nios_fast_jtag_debug_module_resetrequest_from_sa;
  output           nios_fast_jtag_debug_module_write;
  output  [ 31: 0] nios_fast_jtag_debug_module_writedata;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input   [  3: 0] nios_fast_data_master_byteenable;
  input            nios_fast_data_master_debugaccess;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input   [ 23: 0] nios_fast_instruction_master_address_to_slave;
  input            nios_fast_instruction_master_latency_counter;
  input            nios_fast_instruction_master_read;
  input   [ 31: 0] nios_fast_jtag_debug_module_readdata;
  input            nios_fast_jtag_debug_module_resetrequest;
  input            reset_n;

  reg              d1_nios_fast_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_nios_fast_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_nios_fast_data_master_granted_slave_nios_fast_jtag_debug_module;
  reg              last_cycle_nios_fast_instruction_master_granted_slave_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_requests_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_saved_grant_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_arbiterlock;
  wire             nios_fast_instruction_master_arbiterlock2;
  wire             nios_fast_instruction_master_continuerequest;
  wire             nios_fast_instruction_master_granted_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_requests_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_saved_grant_nios_fast_jtag_debug_module;
  wire    [  8: 0] nios_fast_jtag_debug_module_address;
  wire             nios_fast_jtag_debug_module_allgrants;
  wire             nios_fast_jtag_debug_module_allow_new_arb_cycle;
  wire             nios_fast_jtag_debug_module_any_bursting_master_saved_grant;
  wire             nios_fast_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] nios_fast_jtag_debug_module_arb_addend;
  wire             nios_fast_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] nios_fast_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] nios_fast_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] nios_fast_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] nios_fast_jtag_debug_module_arb_winner;
  wire             nios_fast_jtag_debug_module_arbitration_holdoff_internal;
  wire             nios_fast_jtag_debug_module_beginbursttransfer_internal;
  wire             nios_fast_jtag_debug_module_begins_xfer;
  wire             nios_fast_jtag_debug_module_begintransfer;
  wire    [  3: 0] nios_fast_jtag_debug_module_byteenable;
  wire             nios_fast_jtag_debug_module_chipselect;
  wire    [  3: 0] nios_fast_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] nios_fast_jtag_debug_module_chosen_master_rot_left;
  wire             nios_fast_jtag_debug_module_debugaccess;
  wire             nios_fast_jtag_debug_module_end_xfer;
  wire             nios_fast_jtag_debug_module_firsttransfer;
  wire    [  1: 0] nios_fast_jtag_debug_module_grant_vector;
  wire             nios_fast_jtag_debug_module_in_a_read_cycle;
  wire             nios_fast_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] nios_fast_jtag_debug_module_master_qreq_vector;
  wire             nios_fast_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] nios_fast_jtag_debug_module_readdata_from_sa;
  reg              nios_fast_jtag_debug_module_reg_firsttransfer;
  wire             nios_fast_jtag_debug_module_reset;
  wire             nios_fast_jtag_debug_module_reset_n;
  wire             nios_fast_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] nios_fast_jtag_debug_module_saved_chosen_master_vector;
  reg              nios_fast_jtag_debug_module_slavearbiterlockenable;
  wire             nios_fast_jtag_debug_module_slavearbiterlockenable2;
  wire             nios_fast_jtag_debug_module_unreg_firsttransfer;
  wire             nios_fast_jtag_debug_module_waits_for_read;
  wire             nios_fast_jtag_debug_module_waits_for_write;
  wire             nios_fast_jtag_debug_module_write;
  wire    [ 31: 0] nios_fast_jtag_debug_module_writedata;
  wire    [ 23: 0] shifted_address_to_nios_fast_jtag_debug_module_from_nios_fast_data_master;
  wire    [ 23: 0] shifted_address_to_nios_fast_jtag_debug_module_from_nios_fast_instruction_master;
  wire             wait_for_nios_fast_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~nios_fast_jtag_debug_module_end_xfer;
    end


  assign nios_fast_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module | nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module));
  //assign nios_fast_jtag_debug_module_readdata_from_sa = nios_fast_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_fast_jtag_debug_module_readdata_from_sa = nios_fast_jtag_debug_module_readdata;

  assign nios_fast_data_master_requests_nios_fast_jtag_debug_module = ({nios_fast_data_master_address_to_slave[23 : 11] , 11'b0} == 24'h901000) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //nios_fast_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign nios_fast_jtag_debug_module_arb_share_set_values = 1;

  //nios_fast_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign nios_fast_jtag_debug_module_non_bursting_master_requests = nios_fast_data_master_requests_nios_fast_jtag_debug_module |
    nios_fast_instruction_master_requests_nios_fast_jtag_debug_module |
    nios_fast_data_master_requests_nios_fast_jtag_debug_module |
    nios_fast_instruction_master_requests_nios_fast_jtag_debug_module;

  //nios_fast_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign nios_fast_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //nios_fast_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign nios_fast_jtag_debug_module_arb_share_counter_next_value = nios_fast_jtag_debug_module_firsttransfer ? (nios_fast_jtag_debug_module_arb_share_set_values - 1) : |nios_fast_jtag_debug_module_arb_share_counter ? (nios_fast_jtag_debug_module_arb_share_counter - 1) : 0;

  //nios_fast_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign nios_fast_jtag_debug_module_allgrants = |nios_fast_jtag_debug_module_grant_vector |
    |nios_fast_jtag_debug_module_grant_vector |
    |nios_fast_jtag_debug_module_grant_vector |
    |nios_fast_jtag_debug_module_grant_vector;

  //nios_fast_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign nios_fast_jtag_debug_module_end_xfer = ~(nios_fast_jtag_debug_module_waits_for_read | nios_fast_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_nios_fast_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_nios_fast_jtag_debug_module = nios_fast_jtag_debug_module_end_xfer & (~nios_fast_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //nios_fast_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign nios_fast_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_nios_fast_jtag_debug_module & nios_fast_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_nios_fast_jtag_debug_module & ~nios_fast_jtag_debug_module_non_bursting_master_requests);

  //nios_fast_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_jtag_debug_module_arb_share_counter <= 0;
      else if (nios_fast_jtag_debug_module_arb_counter_enable)
          nios_fast_jtag_debug_module_arb_share_counter <= nios_fast_jtag_debug_module_arb_share_counter_next_value;
    end


  //nios_fast_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|nios_fast_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_nios_fast_jtag_debug_module) | (end_xfer_arb_share_counter_term_nios_fast_jtag_debug_module & ~nios_fast_jtag_debug_module_non_bursting_master_requests))
          nios_fast_jtag_debug_module_slavearbiterlockenable <= |nios_fast_jtag_debug_module_arb_share_counter_next_value;
    end


  //nios_fast/data_master nios_fast/jtag_debug_module arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = nios_fast_jtag_debug_module_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //nios_fast_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign nios_fast_jtag_debug_module_slavearbiterlockenable2 = |nios_fast_jtag_debug_module_arb_share_counter_next_value;

  //nios_fast/data_master nios_fast/jtag_debug_module arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = nios_fast_jtag_debug_module_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //nios_fast/instruction_master nios_fast/jtag_debug_module arbiterlock, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock = nios_fast_jtag_debug_module_slavearbiterlockenable & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master nios_fast/jtag_debug_module arbiterlock2, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock2 = nios_fast_jtag_debug_module_slavearbiterlockenable2 & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master granted nios_fast/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_instruction_master_granted_slave_nios_fast_jtag_debug_module <= 0;
      else if (1)
          last_cycle_nios_fast_instruction_master_granted_slave_nios_fast_jtag_debug_module <= nios_fast_instruction_master_saved_grant_nios_fast_jtag_debug_module ? 1 : (nios_fast_jtag_debug_module_arbitration_holdoff_internal | ~nios_fast_instruction_master_requests_nios_fast_jtag_debug_module) ? 0 : last_cycle_nios_fast_instruction_master_granted_slave_nios_fast_jtag_debug_module;
    end


  //nios_fast_instruction_master_continuerequest continued request, which is an e_mux
  assign nios_fast_instruction_master_continuerequest = last_cycle_nios_fast_instruction_master_granted_slave_nios_fast_jtag_debug_module & nios_fast_instruction_master_requests_nios_fast_jtag_debug_module;

  //nios_fast_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign nios_fast_jtag_debug_module_any_continuerequest = nios_fast_instruction_master_continuerequest |
    nios_fast_data_master_continuerequest;

  assign nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module = nios_fast_data_master_requests_nios_fast_jtag_debug_module & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))) | nios_fast_instruction_master_arbiterlock);
  //local readdatavalid nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module, which is an e_mux
  assign nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module = nios_fast_data_master_granted_nios_fast_jtag_debug_module & nios_fast_data_master_read & ~nios_fast_jtag_debug_module_waits_for_read;

  //nios_fast_jtag_debug_module_writedata mux, which is an e_mux
  assign nios_fast_jtag_debug_module_writedata = nios_fast_data_master_writedata;

  //mux nios_fast_jtag_debug_module_debugaccess, which is an e_mux
  assign nios_fast_jtag_debug_module_debugaccess = nios_fast_data_master_debugaccess;

  assign nios_fast_instruction_master_requests_nios_fast_jtag_debug_module = (({nios_fast_instruction_master_address_to_slave[23 : 11] , 11'b0} == 24'h901000) & (nios_fast_instruction_master_read)) & nios_fast_instruction_master_read;
  //nios_fast/data_master granted nios_fast/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_data_master_granted_slave_nios_fast_jtag_debug_module <= 0;
      else if (1)
          last_cycle_nios_fast_data_master_granted_slave_nios_fast_jtag_debug_module <= nios_fast_data_master_saved_grant_nios_fast_jtag_debug_module ? 1 : (nios_fast_jtag_debug_module_arbitration_holdoff_internal | ~nios_fast_data_master_requests_nios_fast_jtag_debug_module) ? 0 : last_cycle_nios_fast_data_master_granted_slave_nios_fast_jtag_debug_module;
    end


  //nios_fast_data_master_continuerequest continued request, which is an e_mux
  assign nios_fast_data_master_continuerequest = last_cycle_nios_fast_data_master_granted_slave_nios_fast_jtag_debug_module & nios_fast_data_master_requests_nios_fast_jtag_debug_module;

  assign nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module = nios_fast_instruction_master_requests_nios_fast_jtag_debug_module & ~((nios_fast_instruction_master_read & ((nios_fast_instruction_master_latency_counter != 0))) | nios_fast_data_master_arbiterlock);
  //local readdatavalid nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module, which is an e_mux
  assign nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module = nios_fast_instruction_master_granted_nios_fast_jtag_debug_module & nios_fast_instruction_master_read & ~nios_fast_jtag_debug_module_waits_for_read;

  //allow new arb cycle for nios_fast/jtag_debug_module, which is an e_assign
  assign nios_fast_jtag_debug_module_allow_new_arb_cycle = ~nios_fast_data_master_arbiterlock & ~nios_fast_instruction_master_arbiterlock;

  //nios_fast/instruction_master assignment into master qualified-requests vector for nios_fast/jtag_debug_module, which is an e_assign
  assign nios_fast_jtag_debug_module_master_qreq_vector[0] = nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module;

  //nios_fast/instruction_master grant nios_fast/jtag_debug_module, which is an e_assign
  assign nios_fast_instruction_master_granted_nios_fast_jtag_debug_module = nios_fast_jtag_debug_module_grant_vector[0];

  //nios_fast/instruction_master saved-grant nios_fast/jtag_debug_module, which is an e_assign
  assign nios_fast_instruction_master_saved_grant_nios_fast_jtag_debug_module = nios_fast_jtag_debug_module_arb_winner[0] && nios_fast_instruction_master_requests_nios_fast_jtag_debug_module;

  //nios_fast/data_master assignment into master qualified-requests vector for nios_fast/jtag_debug_module, which is an e_assign
  assign nios_fast_jtag_debug_module_master_qreq_vector[1] = nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module;

  //nios_fast/data_master grant nios_fast/jtag_debug_module, which is an e_assign
  assign nios_fast_data_master_granted_nios_fast_jtag_debug_module = nios_fast_jtag_debug_module_grant_vector[1];

  //nios_fast/data_master saved-grant nios_fast/jtag_debug_module, which is an e_assign
  assign nios_fast_data_master_saved_grant_nios_fast_jtag_debug_module = nios_fast_jtag_debug_module_arb_winner[1] && nios_fast_data_master_requests_nios_fast_jtag_debug_module;

  //nios_fast/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign nios_fast_jtag_debug_module_chosen_master_double_vector = {nios_fast_jtag_debug_module_master_qreq_vector, nios_fast_jtag_debug_module_master_qreq_vector} & ({~nios_fast_jtag_debug_module_master_qreq_vector, ~nios_fast_jtag_debug_module_master_qreq_vector} + nios_fast_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign nios_fast_jtag_debug_module_arb_winner = (nios_fast_jtag_debug_module_allow_new_arb_cycle & | nios_fast_jtag_debug_module_grant_vector) ? nios_fast_jtag_debug_module_grant_vector : nios_fast_jtag_debug_module_saved_chosen_master_vector;

  //saved nios_fast_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (nios_fast_jtag_debug_module_allow_new_arb_cycle)
          nios_fast_jtag_debug_module_saved_chosen_master_vector <= |nios_fast_jtag_debug_module_grant_vector ? nios_fast_jtag_debug_module_grant_vector : nios_fast_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign nios_fast_jtag_debug_module_grant_vector = {(nios_fast_jtag_debug_module_chosen_master_double_vector[1] | nios_fast_jtag_debug_module_chosen_master_double_vector[3]),
    (nios_fast_jtag_debug_module_chosen_master_double_vector[0] | nios_fast_jtag_debug_module_chosen_master_double_vector[2])};

  //nios_fast/jtag_debug_module chosen master rotated left, which is an e_assign
  assign nios_fast_jtag_debug_module_chosen_master_rot_left = (nios_fast_jtag_debug_module_arb_winner << 1) ? (nios_fast_jtag_debug_module_arb_winner << 1) : 1;

  //nios_fast/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_jtag_debug_module_arb_addend <= 1;
      else if (|nios_fast_jtag_debug_module_grant_vector)
          nios_fast_jtag_debug_module_arb_addend <= nios_fast_jtag_debug_module_end_xfer? nios_fast_jtag_debug_module_chosen_master_rot_left : nios_fast_jtag_debug_module_grant_vector;
    end


  assign nios_fast_jtag_debug_module_begintransfer = nios_fast_jtag_debug_module_begins_xfer;
  //assign lhs ~nios_fast_jtag_debug_module_reset of type reset_n to nios_fast_jtag_debug_module_reset_n, which is an e_assign
  assign nios_fast_jtag_debug_module_reset = ~nios_fast_jtag_debug_module_reset_n;

  //nios_fast_jtag_debug_module_reset_n assignment, which is an e_assign
  assign nios_fast_jtag_debug_module_reset_n = reset_n;

  //assign nios_fast_jtag_debug_module_resetrequest_from_sa = nios_fast_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_fast_jtag_debug_module_resetrequest_from_sa = nios_fast_jtag_debug_module_resetrequest;

  assign nios_fast_jtag_debug_module_chipselect = nios_fast_data_master_granted_nios_fast_jtag_debug_module | nios_fast_instruction_master_granted_nios_fast_jtag_debug_module;
  //nios_fast_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign nios_fast_jtag_debug_module_firsttransfer = nios_fast_jtag_debug_module_begins_xfer ? nios_fast_jtag_debug_module_unreg_firsttransfer : nios_fast_jtag_debug_module_reg_firsttransfer;

  //nios_fast_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign nios_fast_jtag_debug_module_unreg_firsttransfer = ~(nios_fast_jtag_debug_module_slavearbiterlockenable & nios_fast_jtag_debug_module_any_continuerequest);

  //nios_fast_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (nios_fast_jtag_debug_module_begins_xfer)
          nios_fast_jtag_debug_module_reg_firsttransfer <= nios_fast_jtag_debug_module_unreg_firsttransfer;
    end


  //nios_fast_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign nios_fast_jtag_debug_module_beginbursttransfer_internal = nios_fast_jtag_debug_module_begins_xfer;

  //nios_fast_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign nios_fast_jtag_debug_module_arbitration_holdoff_internal = nios_fast_jtag_debug_module_begins_xfer & nios_fast_jtag_debug_module_firsttransfer;

  //nios_fast_jtag_debug_module_write assignment, which is an e_mux
  assign nios_fast_jtag_debug_module_write = nios_fast_data_master_granted_nios_fast_jtag_debug_module & nios_fast_data_master_write;

  assign shifted_address_to_nios_fast_jtag_debug_module_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //nios_fast_jtag_debug_module_address mux, which is an e_mux
  assign nios_fast_jtag_debug_module_address = (nios_fast_data_master_granted_nios_fast_jtag_debug_module)? (shifted_address_to_nios_fast_jtag_debug_module_from_nios_fast_data_master >> 2) :
    (shifted_address_to_nios_fast_jtag_debug_module_from_nios_fast_instruction_master >> 2);

  assign shifted_address_to_nios_fast_jtag_debug_module_from_nios_fast_instruction_master = nios_fast_instruction_master_address_to_slave;
  //d1_nios_fast_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_nios_fast_jtag_debug_module_end_xfer <= 1;
      else if (1)
          d1_nios_fast_jtag_debug_module_end_xfer <= nios_fast_jtag_debug_module_end_xfer;
    end


  //nios_fast_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign nios_fast_jtag_debug_module_waits_for_read = nios_fast_jtag_debug_module_in_a_read_cycle & nios_fast_jtag_debug_module_begins_xfer;

  //nios_fast_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign nios_fast_jtag_debug_module_in_a_read_cycle = (nios_fast_data_master_granted_nios_fast_jtag_debug_module & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_nios_fast_jtag_debug_module & nios_fast_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = nios_fast_jtag_debug_module_in_a_read_cycle;

  //nios_fast_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign nios_fast_jtag_debug_module_waits_for_write = nios_fast_jtag_debug_module_in_a_write_cycle & 0;

  //nios_fast_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign nios_fast_jtag_debug_module_in_a_write_cycle = nios_fast_data_master_granted_nios_fast_jtag_debug_module & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = nios_fast_jtag_debug_module_in_a_write_cycle;

  assign wait_for_nios_fast_jtag_debug_module_counter = 0;
  //nios_fast_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign nios_fast_jtag_debug_module_byteenable = (nios_fast_data_master_granted_nios_fast_jtag_debug_module)? nios_fast_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_fast/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_granted_nios_fast_jtag_debug_module + nios_fast_instruction_master_granted_nios_fast_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_saved_grant_nios_fast_jtag_debug_module + nios_fast_instruction_master_saved_grant_nios_fast_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_fast_data_master_arbitrator (
                                          // inputs:
                                           BUTTON_PIO_s1_readdata_from_sa,
                                           Double_ADS805_0_avalon_slave_0_irq_from_sa,
                                           Double_ADS805_0_avalon_slave_0_readdata_from_sa,
                                           cfi_flash_s1_wait_counter_eq_0,
                                           clk,
                                           d1_BUTTON_PIO_s1_end_xfer,
                                           d1_Double_ADS805_0_avalon_slave_0_end_xfer,
                                           d1_epcs_controller_epcs_control_port_end_xfer,
                                           d1_freq_avalon_0_avalon_slave_0_end_xfer,
                                           d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                           d1_lcd_AO_s1_end_xfer,
                                           d1_lcd_cs_n_s1_end_xfer,
                                           d1_lcd_rst_n_s1_end_xfer,
                                           d1_lcd_sck_s1_end_xfer,
                                           d1_lcd_si_s1_end_xfer,
                                           d1_nios_fast_jtag_debug_module_end_xfer,
                                           d1_sram_16bit_0_avalon_slave_0_end_xfer,
                                           d1_sys_timer_s1_end_xfer,
                                           d1_tristate_bridge_avalon_slave_end_xfer,
                                           epcs_controller_epcs_control_port_irq_from_sa,
                                           epcs_controller_epcs_control_port_readdata_from_sa,
                                           freq_avalon_0_avalon_slave_0_readdata_from_sa,
                                           incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                           jtag_uart_avalon_jtag_slave_irq_from_sa,
                                           jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                           jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                           nios_fast_data_master_address,
                                           nios_fast_data_master_byteenable_cfi_flash_s1,
                                           nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0,
                                           nios_fast_data_master_debugaccess,
                                           nios_fast_data_master_granted_BUTTON_PIO_s1,
                                           nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0,
                                           nios_fast_data_master_granted_cfi_flash_s1,
                                           nios_fast_data_master_granted_epcs_controller_epcs_control_port,
                                           nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0,
                                           nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave,
                                           nios_fast_data_master_granted_lcd_AO_s1,
                                           nios_fast_data_master_granted_lcd_cs_n_s1,
                                           nios_fast_data_master_granted_lcd_rst_n_s1,
                                           nios_fast_data_master_granted_lcd_sck_s1,
                                           nios_fast_data_master_granted_lcd_si_s1,
                                           nios_fast_data_master_granted_nios_fast_jtag_debug_module,
                                           nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0,
                                           nios_fast_data_master_granted_sys_timer_s1,
                                           nios_fast_data_master_qualified_request_BUTTON_PIO_s1,
                                           nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0,
                                           nios_fast_data_master_qualified_request_cfi_flash_s1,
                                           nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port,
                                           nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0,
                                           nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                           nios_fast_data_master_qualified_request_lcd_AO_s1,
                                           nios_fast_data_master_qualified_request_lcd_cs_n_s1,
                                           nios_fast_data_master_qualified_request_lcd_rst_n_s1,
                                           nios_fast_data_master_qualified_request_lcd_sck_s1,
                                           nios_fast_data_master_qualified_request_lcd_si_s1,
                                           nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module,
                                           nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0,
                                           nios_fast_data_master_qualified_request_sys_timer_s1,
                                           nios_fast_data_master_read,
                                           nios_fast_data_master_read_data_valid_BUTTON_PIO_s1,
                                           nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0,
                                           nios_fast_data_master_read_data_valid_cfi_flash_s1,
                                           nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port,
                                           nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0,
                                           nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                           nios_fast_data_master_read_data_valid_lcd_AO_s1,
                                           nios_fast_data_master_read_data_valid_lcd_cs_n_s1,
                                           nios_fast_data_master_read_data_valid_lcd_rst_n_s1,
                                           nios_fast_data_master_read_data_valid_lcd_sck_s1,
                                           nios_fast_data_master_read_data_valid_lcd_si_s1,
                                           nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module,
                                           nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0,
                                           nios_fast_data_master_read_data_valid_sys_timer_s1,
                                           nios_fast_data_master_requests_BUTTON_PIO_s1,
                                           nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0,
                                           nios_fast_data_master_requests_cfi_flash_s1,
                                           nios_fast_data_master_requests_epcs_controller_epcs_control_port,
                                           nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0,
                                           nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave,
                                           nios_fast_data_master_requests_lcd_AO_s1,
                                           nios_fast_data_master_requests_lcd_cs_n_s1,
                                           nios_fast_data_master_requests_lcd_rst_n_s1,
                                           nios_fast_data_master_requests_lcd_sck_s1,
                                           nios_fast_data_master_requests_lcd_si_s1,
                                           nios_fast_data_master_requests_nios_fast_jtag_debug_module,
                                           nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0,
                                           nios_fast_data_master_requests_sys_timer_s1,
                                           nios_fast_data_master_write,
                                           nios_fast_data_master_writedata,
                                           nios_fast_jtag_debug_module_readdata_from_sa,
                                           reset_n,
                                           sram_16bit_0_avalon_slave_0_readdata_from_sa,
                                           sram_16bit_0_avalon_slave_0_wait_counter_eq_0,
                                           sys_timer_s1_irq_from_sa,
                                           sys_timer_s1_readdata_from_sa,

                                          // outputs:
                                           nios_fast_data_master_address_to_slave,
                                           nios_fast_data_master_dbs_address,
                                           nios_fast_data_master_dbs_write_16,
                                           nios_fast_data_master_dbs_write_8,
                                           nios_fast_data_master_irq,
                                           nios_fast_data_master_latency_counter,
                                           nios_fast_data_master_readdata,
                                           nios_fast_data_master_readdatavalid,
                                           nios_fast_data_master_waitrequest
                                        )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [ 23: 0] nios_fast_data_master_address_to_slave;
  output  [  1: 0] nios_fast_data_master_dbs_address;
  output  [ 15: 0] nios_fast_data_master_dbs_write_16;
  output  [  7: 0] nios_fast_data_master_dbs_write_8;
  output  [ 31: 0] nios_fast_data_master_irq;
  output           nios_fast_data_master_latency_counter;
  output  [ 31: 0] nios_fast_data_master_readdata;
  output           nios_fast_data_master_readdatavalid;
  output           nios_fast_data_master_waitrequest;
  input   [  4: 0] BUTTON_PIO_s1_readdata_from_sa;
  input            Double_ADS805_0_avalon_slave_0_irq_from_sa;
  input   [ 31: 0] Double_ADS805_0_avalon_slave_0_readdata_from_sa;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input            d1_BUTTON_PIO_s1_end_xfer;
  input            d1_Double_ADS805_0_avalon_slave_0_end_xfer;
  input            d1_epcs_controller_epcs_control_port_end_xfer;
  input            d1_freq_avalon_0_avalon_slave_0_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_lcd_AO_s1_end_xfer;
  input            d1_lcd_cs_n_s1_end_xfer;
  input            d1_lcd_rst_n_s1_end_xfer;
  input            d1_lcd_sck_s1_end_xfer;
  input            d1_lcd_si_s1_end_xfer;
  input            d1_nios_fast_jtag_debug_module_end_xfer;
  input            d1_sram_16bit_0_avalon_slave_0_end_xfer;
  input            d1_sys_timer_s1_end_xfer;
  input            d1_tristate_bridge_avalon_slave_end_xfer;
  input            epcs_controller_epcs_control_port_irq_from_sa;
  input   [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  input   [ 31: 0] freq_avalon_0_avalon_slave_0_readdata_from_sa;
  input   [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 23: 0] nios_fast_data_master_address;
  input            nios_fast_data_master_byteenable_cfi_flash_s1;
  input   [  1: 0] nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0;
  input            nios_fast_data_master_debugaccess;
  input            nios_fast_data_master_granted_BUTTON_PIO_s1;
  input            nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_data_master_granted_cfi_flash_s1;
  input            nios_fast_data_master_granted_epcs_controller_epcs_control_port;
  input            nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0;
  input            nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            nios_fast_data_master_granted_lcd_AO_s1;
  input            nios_fast_data_master_granted_lcd_cs_n_s1;
  input            nios_fast_data_master_granted_lcd_rst_n_s1;
  input            nios_fast_data_master_granted_lcd_sck_s1;
  input            nios_fast_data_master_granted_lcd_si_s1;
  input            nios_fast_data_master_granted_nios_fast_jtag_debug_module;
  input            nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0;
  input            nios_fast_data_master_granted_sys_timer_s1;
  input            nios_fast_data_master_qualified_request_BUTTON_PIO_s1;
  input            nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_data_master_qualified_request_cfi_flash_s1;
  input            nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port;
  input            nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0;
  input            nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            nios_fast_data_master_qualified_request_lcd_AO_s1;
  input            nios_fast_data_master_qualified_request_lcd_cs_n_s1;
  input            nios_fast_data_master_qualified_request_lcd_rst_n_s1;
  input            nios_fast_data_master_qualified_request_lcd_sck_s1;
  input            nios_fast_data_master_qualified_request_lcd_si_s1;
  input            nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module;
  input            nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0;
  input            nios_fast_data_master_qualified_request_sys_timer_s1;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_read_data_valid_BUTTON_PIO_s1;
  input            nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_data_master_read_data_valid_cfi_flash_s1;
  input            nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port;
  input            nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0;
  input            nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            nios_fast_data_master_read_data_valid_lcd_AO_s1;
  input            nios_fast_data_master_read_data_valid_lcd_cs_n_s1;
  input            nios_fast_data_master_read_data_valid_lcd_rst_n_s1;
  input            nios_fast_data_master_read_data_valid_lcd_sck_s1;
  input            nios_fast_data_master_read_data_valid_lcd_si_s1;
  input            nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module;
  input            nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  input            nios_fast_data_master_read_data_valid_sys_timer_s1;
  input            nios_fast_data_master_requests_BUTTON_PIO_s1;
  input            nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_data_master_requests_cfi_flash_s1;
  input            nios_fast_data_master_requests_epcs_controller_epcs_control_port;
  input            nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0;
  input            nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            nios_fast_data_master_requests_lcd_AO_s1;
  input            nios_fast_data_master_requests_lcd_cs_n_s1;
  input            nios_fast_data_master_requests_lcd_rst_n_s1;
  input            nios_fast_data_master_requests_lcd_sck_s1;
  input            nios_fast_data_master_requests_lcd_si_s1;
  input            nios_fast_data_master_requests_nios_fast_jtag_debug_module;
  input            nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0;
  input            nios_fast_data_master_requests_sys_timer_s1;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input   [ 31: 0] nios_fast_jtag_debug_module_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sram_16bit_0_avalon_slave_0_readdata_from_sa;
  input            sram_16bit_0_avalon_slave_0_wait_counter_eq_0;
  input            sys_timer_s1_irq_from_sa;
  input   [ 15: 0] sys_timer_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  reg     [ 23: 0] nios_fast_data_master_address_last_time;
  wire    [ 23: 0] nios_fast_data_master_address_to_slave;
  reg     [  1: 0] nios_fast_data_master_dbs_address;
  wire    [  1: 0] nios_fast_data_master_dbs_increment;
  reg     [  1: 0] nios_fast_data_master_dbs_rdv_counter;
  wire    [  1: 0] nios_fast_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] nios_fast_data_master_dbs_write_16;
  wire    [  7: 0] nios_fast_data_master_dbs_write_8;
  wire    [ 31: 0] nios_fast_data_master_irq;
  wire             nios_fast_data_master_is_granted_some_slave;
  reg              nios_fast_data_master_latency_counter;
  wire    [  1: 0] nios_fast_data_master_next_dbs_rdv_counter;
  reg              nios_fast_data_master_read_but_no_slave_selected;
  reg              nios_fast_data_master_read_last_time;
  wire    [ 31: 0] nios_fast_data_master_readdata;
  wire             nios_fast_data_master_readdatavalid;
  wire             nios_fast_data_master_run;
  wire             nios_fast_data_master_waitrequest;
  reg              nios_fast_data_master_write_last_time;
  reg     [ 31: 0] nios_fast_data_master_writedata_last_time;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             p1_nios_fast_data_master_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_nios_fast_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (nios_fast_data_master_qualified_request_BUTTON_PIO_s1 | ~nios_fast_data_master_requests_BUTTON_PIO_s1) & ((~nios_fast_data_master_qualified_request_BUTTON_PIO_s1 | ~nios_fast_data_master_read | (1 & ~d1_BUTTON_PIO_s1_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_BUTTON_PIO_s1 | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & (nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0 | ~nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0) & (nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 | ~nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0) & ((~nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0 | ~(nios_fast_data_master_read | nios_fast_data_master_write) | (1 & ~d1_Double_ADS805_0_avalon_slave_0_end_xfer & (nios_fast_data_master_read | nios_fast_data_master_write)))) & ((~nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0 | ~(nios_fast_data_master_read | nios_fast_data_master_write) | (1 & ~d1_Double_ADS805_0_avalon_slave_0_end_xfer & (nios_fast_data_master_read | nios_fast_data_master_write)))) & 1 & (nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port | ~nios_fast_data_master_requests_epcs_controller_epcs_control_port) & (nios_fast_data_master_granted_epcs_controller_epcs_control_port | ~nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port) & ((~nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port | ~(nios_fast_data_master_read | nios_fast_data_master_write) | (1 & ~d1_epcs_controller_epcs_control_port_end_xfer & (nios_fast_data_master_read | nios_fast_data_master_write)))) & ((~nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port | ~(nios_fast_data_master_read | nios_fast_data_master_write) | (1 & ~d1_epcs_controller_epcs_control_port_end_xfer & (nios_fast_data_master_read | nios_fast_data_master_write)))) & 1 & (nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0 | ~nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0) & ((~nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0 | ~nios_fast_data_master_read | (1 & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0 | ~nios_fast_data_master_write | (1 & ~d1_freq_avalon_0_avalon_slave_0_end_xfer & nios_fast_data_master_write))) & 1 & (nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave);

  //cascaded wait assignment, which is an e_assign
  assign nios_fast_data_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(nios_fast_data_master_read | nios_fast_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (nios_fast_data_master_read | nios_fast_data_master_write)))) & ((~nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(nios_fast_data_master_read | nios_fast_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (nios_fast_data_master_read | nios_fast_data_master_write)))) & 1 & ((~nios_fast_data_master_qualified_request_lcd_AO_s1 | ~nios_fast_data_master_read | (1 & ~d1_lcd_AO_s1_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_lcd_AO_s1 | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & ((~nios_fast_data_master_qualified_request_lcd_cs_n_s1 | ~nios_fast_data_master_read | (1 & ~d1_lcd_cs_n_s1_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_lcd_cs_n_s1 | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & ((~nios_fast_data_master_qualified_request_lcd_rst_n_s1 | ~nios_fast_data_master_read | (1 & ~d1_lcd_rst_n_s1_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_lcd_rst_n_s1 | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & ((~nios_fast_data_master_qualified_request_lcd_sck_s1 | ~nios_fast_data_master_read | (1 & ~d1_lcd_sck_s1_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_lcd_sck_s1 | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & ((~nios_fast_data_master_qualified_request_lcd_si_s1 | ~nios_fast_data_master_read | (1 & ~d1_lcd_si_s1_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_lcd_si_s1 | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & (nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module | ~nios_fast_data_master_requests_nios_fast_jtag_debug_module) & (nios_fast_data_master_granted_nios_fast_jtag_debug_module | ~nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module);

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module | ~nios_fast_data_master_read | (1 & ~d1_nios_fast_jtag_debug_module_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & (nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0 | (nios_fast_data_master_write & !nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_dbs_address[1]) | ~nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0) & (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 | ~nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0) & ((~nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0 | ~nios_fast_data_master_read | (1 & ((sram_16bit_0_avalon_slave_0_wait_counter_eq_0 & ~d1_sram_16bit_0_avalon_slave_0_end_xfer)) & (nios_fast_data_master_dbs_address[1]) & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0 | ~nios_fast_data_master_write | (1 & ((sram_16bit_0_avalon_slave_0_wait_counter_eq_0 & ~d1_sram_16bit_0_avalon_slave_0_end_xfer)) & (nios_fast_data_master_dbs_address[1]) & nios_fast_data_master_write))) & 1 & (nios_fast_data_master_qualified_request_sys_timer_s1 | ~nios_fast_data_master_requests_sys_timer_s1) & ((~nios_fast_data_master_qualified_request_sys_timer_s1 | ~nios_fast_data_master_read | (1 & ~d1_sys_timer_s1_end_xfer & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_sys_timer_s1 | ~nios_fast_data_master_write | (1 & nios_fast_data_master_write))) & 1 & ((nios_fast_data_master_qualified_request_cfi_flash_s1 | ((nios_fast_data_master_write & !nios_fast_data_master_byteenable_cfi_flash_s1 & nios_fast_data_master_dbs_address[1] & nios_fast_data_master_dbs_address[0])) | ~nios_fast_data_master_requests_cfi_flash_s1)) & (nios_fast_data_master_granted_cfi_flash_s1 | ~nios_fast_data_master_qualified_request_cfi_flash_s1) & ((~nios_fast_data_master_qualified_request_cfi_flash_s1 | ~nios_fast_data_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer)) & (nios_fast_data_master_dbs_address[1] & nios_fast_data_master_dbs_address[0]) & nios_fast_data_master_read))) & ((~nios_fast_data_master_qualified_request_cfi_flash_s1 | ~nios_fast_data_master_write | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer)) & (nios_fast_data_master_dbs_address[1] & nios_fast_data_master_dbs_address[0]) & nios_fast_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign nios_fast_data_master_address_to_slave = nios_fast_data_master_address[23 : 0];

  //nios_fast_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_read_but_no_slave_selected <= 0;
      else if (1)
          nios_fast_data_master_read_but_no_slave_selected <= nios_fast_data_master_read & nios_fast_data_master_run & ~nios_fast_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign nios_fast_data_master_is_granted_some_slave = nios_fast_data_master_granted_BUTTON_PIO_s1 |
    nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0 |
    nios_fast_data_master_granted_epcs_controller_epcs_control_port |
    nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0 |
    nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave |
    nios_fast_data_master_granted_lcd_AO_s1 |
    nios_fast_data_master_granted_lcd_cs_n_s1 |
    nios_fast_data_master_granted_lcd_rst_n_s1 |
    nios_fast_data_master_granted_lcd_sck_s1 |
    nios_fast_data_master_granted_lcd_si_s1 |
    nios_fast_data_master_granted_nios_fast_jtag_debug_module |
    nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 |
    nios_fast_data_master_granted_sys_timer_s1 |
    nios_fast_data_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_nios_fast_data_master_readdatavalid = nios_fast_data_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign nios_fast_data_master_readdatavalid = nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_BUTTON_PIO_s1 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_lcd_AO_s1 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_lcd_cs_n_s1 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_lcd_rst_n_s1 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_lcd_sck_s1 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_lcd_si_s1 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    (nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0 & dbs_counter_overflow) |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid |
    nios_fast_data_master_read_data_valid_sys_timer_s1 |
    nios_fast_data_master_read_but_no_slave_selected |
    pre_flush_nios_fast_data_master_readdatavalid;

  //nios_fast/data_master readdata mux, which is an e_mux
  assign nios_fast_data_master_readdata = ({32 {~(nios_fast_data_master_qualified_request_BUTTON_PIO_s1 & nios_fast_data_master_read)}} | BUTTON_PIO_s1_readdata_from_sa) &
    ({32 {~(nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0 & nios_fast_data_master_read)}} | Double_ADS805_0_avalon_slave_0_readdata_from_sa) &
    ({32 {~(nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port & nios_fast_data_master_read)}} | epcs_controller_epcs_control_port_readdata_from_sa) &
    ({32 {~(nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0 & nios_fast_data_master_read)}} | freq_avalon_0_avalon_slave_0_readdata_from_sa) &
    ({32 {~(nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave & nios_fast_data_master_read)}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module & nios_fast_data_master_read)}} | nios_fast_jtag_debug_module_readdata_from_sa) &
    ({32 {~(nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_read)}} | {sram_16bit_0_avalon_slave_0_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~(nios_fast_data_master_qualified_request_sys_timer_s1 & nios_fast_data_master_read)}} | sys_timer_s1_readdata_from_sa) &
    ({32 {~nios_fast_data_master_read_data_valid_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign nios_fast_data_master_waitrequest = ~nios_fast_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_latency_counter <= 0;
      else if (1)
          nios_fast_data_master_latency_counter <= p1_nios_fast_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_nios_fast_data_master_latency_counter = ((nios_fast_data_master_run & nios_fast_data_master_read))? latency_load_value :
    (nios_fast_data_master_latency_counter)? nios_fast_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {nios_fast_data_master_requests_cfi_flash_s1}} & 1;

  //irq assign, which is an e_assign
  assign nios_fast_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    Double_ADS805_0_avalon_slave_0_irq_from_sa,
    sys_timer_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    epcs_controller_epcs_control_port_irq_from_sa};

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_write & !nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0)) |
    ((nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_read & 1 & 1 & ({sram_16bit_0_avalon_slave_0_wait_counter_eq_0 & ~d1_sram_16bit_0_avalon_slave_0_end_xfer}))) |
    ((nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_write & 1 & 1 & ({sram_16bit_0_avalon_slave_0_wait_counter_eq_0 & ~d1_sram_16bit_0_avalon_slave_0_end_xfer}))) |
    (((~0) & nios_fast_data_master_requests_cfi_flash_s1 & nios_fast_data_master_write & !nios_fast_data_master_byteenable_cfi_flash_s1)) |
    ((nios_fast_data_master_granted_cfi_flash_s1 & nios_fast_data_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer}))) |
    ((nios_fast_data_master_granted_cfi_flash_s1 & nios_fast_data_master_write & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_16bit_0_avalon_slave_0_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((nios_fast_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign nios_fast_data_master_dbs_write_16 = (nios_fast_data_master_dbs_address[1])? nios_fast_data_master_writedata[31 : 16] :
    nios_fast_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign nios_fast_data_master_dbs_increment = (nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0)? 2 :
    (nios_fast_data_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = nios_fast_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = nios_fast_data_master_dbs_address + nios_fast_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          nios_fast_data_master_dbs_address <= next_dbs_address;
    end


  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((nios_fast_data_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((nios_fast_data_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((nios_fast_data_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign nios_fast_data_master_dbs_write_8 = ((nios_fast_data_master_dbs_address[1 : 0] == 0))? nios_fast_data_master_writedata[7 : 0] :
    ((nios_fast_data_master_dbs_address[1 : 0] == 1))? nios_fast_data_master_writedata[15 : 8] :
    ((nios_fast_data_master_dbs_address[1 : 0] == 2))? nios_fast_data_master_writedata[23 : 16] :
    nios_fast_data_master_writedata[31 : 24];

  //p1 dbs rdv counter, which is an e_assign
  assign nios_fast_data_master_next_dbs_rdv_counter = nios_fast_data_master_dbs_rdv_counter + nios_fast_data_master_dbs_rdv_counter_inc;

  //nios_fast_data_master_rdv_inc_mux, which is an e_mux
  assign nios_fast_data_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = nios_fast_data_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          nios_fast_data_master_dbs_rdv_counter <= nios_fast_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = nios_fast_data_master_dbs_rdv_counter[1] & ~nios_fast_data_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_fast_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_address_last_time <= 0;
      else if (1)
          nios_fast_data_master_address_last_time <= nios_fast_data_master_address;
    end


  //nios_fast/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= nios_fast_data_master_waitrequest & (nios_fast_data_master_read | nios_fast_data_master_write);
    end


  //nios_fast_data_master_address matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or nios_fast_data_master_address or nios_fast_data_master_address_last_time)
    begin
      if (active_and_waiting_last_time & (nios_fast_data_master_address != nios_fast_data_master_address_last_time))
        begin
          $write("%0d ns: nios_fast_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_fast_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_read_last_time <= 0;
      else if (1)
          nios_fast_data_master_read_last_time <= nios_fast_data_master_read;
    end


  //nios_fast_data_master_read matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or nios_fast_data_master_read or nios_fast_data_master_read_last_time)
    begin
      if (active_and_waiting_last_time & (nios_fast_data_master_read != nios_fast_data_master_read_last_time))
        begin
          $write("%0d ns: nios_fast_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_fast_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_write_last_time <= 0;
      else if (1)
          nios_fast_data_master_write_last_time <= nios_fast_data_master_write;
    end


  //nios_fast_data_master_write matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or nios_fast_data_master_write or nios_fast_data_master_write_last_time)
    begin
      if (active_and_waiting_last_time & (nios_fast_data_master_write != nios_fast_data_master_write_last_time))
        begin
          $write("%0d ns: nios_fast_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_fast_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_writedata_last_time <= 0;
      else if (1)
          nios_fast_data_master_writedata_last_time <= nios_fast_data_master_writedata;
    end


  //nios_fast_data_master_writedata matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or nios_fast_data_master_write or nios_fast_data_master_writedata or nios_fast_data_master_writedata_last_time)
    begin
      if (active_and_waiting_last_time & (nios_fast_data_master_writedata != nios_fast_data_master_writedata_last_time) & nios_fast_data_master_write)
        begin
          $write("%0d ns: nios_fast_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_fast_instruction_master_arbitrator (
                                                 // inputs:
                                                  Double_ADS805_0_avalon_slave_0_readdata_from_sa,
                                                  cfi_flash_s1_wait_counter_eq_0,
                                                  clk,
                                                  d1_Double_ADS805_0_avalon_slave_0_end_xfer,
                                                  d1_epcs_controller_epcs_control_port_end_xfer,
                                                  d1_nios_fast_jtag_debug_module_end_xfer,
                                                  d1_sram_16bit_0_avalon_slave_0_end_xfer,
                                                  d1_tristate_bridge_avalon_slave_end_xfer,
                                                  epcs_controller_epcs_control_port_readdata_from_sa,
                                                  incoming_data_to_and_from_the_cfi_flash,
                                                  nios_fast_instruction_master_address,
                                                  nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0,
                                                  nios_fast_instruction_master_granted_cfi_flash_s1,
                                                  nios_fast_instruction_master_granted_epcs_controller_epcs_control_port,
                                                  nios_fast_instruction_master_granted_nios_fast_jtag_debug_module,
                                                  nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0,
                                                  nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0,
                                                  nios_fast_instruction_master_qualified_request_cfi_flash_s1,
                                                  nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port,
                                                  nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module,
                                                  nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0,
                                                  nios_fast_instruction_master_read,
                                                  nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0,
                                                  nios_fast_instruction_master_read_data_valid_cfi_flash_s1,
                                                  nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port,
                                                  nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module,
                                                  nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0,
                                                  nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0,
                                                  nios_fast_instruction_master_requests_cfi_flash_s1,
                                                  nios_fast_instruction_master_requests_epcs_controller_epcs_control_port,
                                                  nios_fast_instruction_master_requests_nios_fast_jtag_debug_module,
                                                  nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0,
                                                  nios_fast_jtag_debug_module_readdata_from_sa,
                                                  reset_n,
                                                  sram_16bit_0_avalon_slave_0_readdata_from_sa,
                                                  sram_16bit_0_avalon_slave_0_wait_counter_eq_0,

                                                 // outputs:
                                                  nios_fast_instruction_master_address_to_slave,
                                                  nios_fast_instruction_master_dbs_address,
                                                  nios_fast_instruction_master_latency_counter,
                                                  nios_fast_instruction_master_readdata,
                                                  nios_fast_instruction_master_readdatavalid,
                                                  nios_fast_instruction_master_waitrequest
                                               )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [ 23: 0] nios_fast_instruction_master_address_to_slave;
  output  [  1: 0] nios_fast_instruction_master_dbs_address;
  output           nios_fast_instruction_master_latency_counter;
  output  [ 31: 0] nios_fast_instruction_master_readdata;
  output           nios_fast_instruction_master_readdatavalid;
  output           nios_fast_instruction_master_waitrequest;
  input   [ 31: 0] Double_ADS805_0_avalon_slave_0_readdata_from_sa;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input            d1_Double_ADS805_0_avalon_slave_0_end_xfer;
  input            d1_epcs_controller_epcs_control_port_end_xfer;
  input            d1_nios_fast_jtag_debug_module_end_xfer;
  input            d1_sram_16bit_0_avalon_slave_0_end_xfer;
  input            d1_tristate_bridge_avalon_slave_end_xfer;
  input   [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  input   [  7: 0] incoming_data_to_and_from_the_cfi_flash;
  input   [ 23: 0] nios_fast_instruction_master_address;
  input            nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_instruction_master_granted_cfi_flash_s1;
  input            nios_fast_instruction_master_granted_epcs_controller_epcs_control_port;
  input            nios_fast_instruction_master_granted_nios_fast_jtag_debug_module;
  input            nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0;
  input            nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_instruction_master_qualified_request_cfi_flash_s1;
  input            nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  input            nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module;
  input            nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0;
  input            nios_fast_instruction_master_read;
  input            nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_instruction_master_read_data_valid_cfi_flash_s1;
  input            nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  input            nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module;
  input            nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  input            nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0;
  input            nios_fast_instruction_master_requests_cfi_flash_s1;
  input            nios_fast_instruction_master_requests_epcs_controller_epcs_control_port;
  input            nios_fast_instruction_master_requests_nios_fast_jtag_debug_module;
  input            nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0;
  input   [ 31: 0] nios_fast_jtag_debug_module_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sram_16bit_0_avalon_slave_0_readdata_from_sa;
  input            sram_16bit_0_avalon_slave_0_wait_counter_eq_0;

  reg              active_and_waiting_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  reg     [ 23: 0] nios_fast_instruction_master_address_last_time;
  wire    [ 23: 0] nios_fast_instruction_master_address_to_slave;
  reg     [  1: 0] nios_fast_instruction_master_dbs_address;
  wire    [  1: 0] nios_fast_instruction_master_dbs_increment;
  reg     [  1: 0] nios_fast_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] nios_fast_instruction_master_dbs_rdv_counter_inc;
  wire             nios_fast_instruction_master_is_granted_some_slave;
  reg              nios_fast_instruction_master_latency_counter;
  wire    [  1: 0] nios_fast_instruction_master_next_dbs_rdv_counter;
  reg              nios_fast_instruction_master_read_but_no_slave_selected;
  reg              nios_fast_instruction_master_read_last_time;
  wire    [ 31: 0] nios_fast_instruction_master_readdata;
  wire             nios_fast_instruction_master_readdatavalid;
  wire             nios_fast_instruction_master_run;
  wire             nios_fast_instruction_master_waitrequest;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             p1_nios_fast_instruction_master_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_nios_fast_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0 | ~nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0) & (nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0 | ~nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0) & ((~nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0 | ~(nios_fast_instruction_master_read) | (1 & ~d1_Double_ADS805_0_avalon_slave_0_end_xfer & (nios_fast_instruction_master_read)))) & 1 & (nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port | ~nios_fast_instruction_master_requests_epcs_controller_epcs_control_port) & (nios_fast_instruction_master_granted_epcs_controller_epcs_control_port | ~nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port) & ((~nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port | ~(nios_fast_instruction_master_read) | (1 & ~d1_epcs_controller_epcs_control_port_end_xfer & (nios_fast_instruction_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign nios_fast_instruction_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module | ~nios_fast_instruction_master_requests_nios_fast_jtag_debug_module);

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = (nios_fast_instruction_master_granted_nios_fast_jtag_debug_module | ~nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module) & ((~nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module | ~nios_fast_instruction_master_read | (1 & ~d1_nios_fast_jtag_debug_module_end_xfer & nios_fast_instruction_master_read))) & 1 & (nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0 | ~nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0) & (nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 | ~nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0) & ((~nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0 | ~nios_fast_instruction_master_read | (1 & ((sram_16bit_0_avalon_slave_0_wait_counter_eq_0 & ~d1_sram_16bit_0_avalon_slave_0_end_xfer)) & (nios_fast_instruction_master_dbs_address[1]) & nios_fast_instruction_master_read))) & 1 & (nios_fast_instruction_master_qualified_request_cfi_flash_s1 | ~nios_fast_instruction_master_requests_cfi_flash_s1) & (nios_fast_instruction_master_granted_cfi_flash_s1 | ~nios_fast_instruction_master_qualified_request_cfi_flash_s1) & ((~nios_fast_instruction_master_qualified_request_cfi_flash_s1 | ~nios_fast_instruction_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer)) & (nios_fast_instruction_master_dbs_address[1] & nios_fast_instruction_master_dbs_address[0]) & nios_fast_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign nios_fast_instruction_master_address_to_slave = nios_fast_instruction_master_address[23 : 0];

  //nios_fast_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_instruction_master_read_but_no_slave_selected <= 0;
      else if (1)
          nios_fast_instruction_master_read_but_no_slave_selected <= nios_fast_instruction_master_read & nios_fast_instruction_master_run & ~nios_fast_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign nios_fast_instruction_master_is_granted_some_slave = nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0 |
    nios_fast_instruction_master_granted_epcs_controller_epcs_control_port |
    nios_fast_instruction_master_granted_nios_fast_jtag_debug_module |
    nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 |
    nios_fast_instruction_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_nios_fast_instruction_master_readdatavalid = nios_fast_instruction_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign nios_fast_instruction_master_readdatavalid = nios_fast_instruction_master_read_but_no_slave_selected |
    pre_flush_nios_fast_instruction_master_readdatavalid |
    nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0 |
    nios_fast_instruction_master_read_but_no_slave_selected |
    pre_flush_nios_fast_instruction_master_readdatavalid |
    nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port |
    nios_fast_instruction_master_read_but_no_slave_selected |
    pre_flush_nios_fast_instruction_master_readdatavalid |
    nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module |
    nios_fast_instruction_master_read_but_no_slave_selected |
    pre_flush_nios_fast_instruction_master_readdatavalid |
    (nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0 & dbs_counter_overflow) |
    nios_fast_instruction_master_read_but_no_slave_selected |
    pre_flush_nios_fast_instruction_master_readdatavalid;

  //nios_fast/instruction_master readdata mux, which is an e_mux
  assign nios_fast_instruction_master_readdata = ({32 {~(nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0 & nios_fast_instruction_master_read)}} | Double_ADS805_0_avalon_slave_0_readdata_from_sa) &
    ({32 {~(nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port & nios_fast_instruction_master_read)}} | epcs_controller_epcs_control_port_readdata_from_sa) &
    ({32 {~(nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module & nios_fast_instruction_master_read)}} | nios_fast_jtag_debug_module_readdata_from_sa) &
    ({32 {~(nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0 & nios_fast_instruction_master_read)}} | {sram_16bit_0_avalon_slave_0_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~nios_fast_instruction_master_read_data_valid_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign nios_fast_instruction_master_waitrequest = ~nios_fast_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_instruction_master_latency_counter <= 0;
      else if (1)
          nios_fast_instruction_master_latency_counter <= p1_nios_fast_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_nios_fast_instruction_master_latency_counter = ((nios_fast_instruction_master_run & nios_fast_instruction_master_read))? latency_load_value :
    (nios_fast_instruction_master_latency_counter)? nios_fast_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {nios_fast_instruction_master_requests_cfi_flash_s1}} & 1;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_16bit_0_avalon_slave_0_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((nios_fast_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign nios_fast_instruction_master_dbs_increment = (nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0)? 2 :
    (nios_fast_instruction_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = nios_fast_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = nios_fast_instruction_master_dbs_address + nios_fast_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          nios_fast_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = ((nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_instruction_master_read & 1 & 1 & ({sram_16bit_0_avalon_slave_0_wait_counter_eq_0 & ~d1_sram_16bit_0_avalon_slave_0_end_xfer}))) |
    ((nios_fast_instruction_master_granted_cfi_flash_s1 & nios_fast_instruction_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tristate_bridge_avalon_slave_end_xfer})));

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_data_to_and_from_the_cfi_flash;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((nios_fast_instruction_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_data_to_and_from_the_cfi_flash;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((nios_fast_instruction_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_data_to_and_from_the_cfi_flash;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((nios_fast_instruction_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign nios_fast_instruction_master_next_dbs_rdv_counter = nios_fast_instruction_master_dbs_rdv_counter + nios_fast_instruction_master_dbs_rdv_counter_inc;

  //nios_fast_instruction_master_rdv_inc_mux, which is an e_mux
  assign nios_fast_instruction_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = nios_fast_instruction_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          nios_fast_instruction_master_dbs_rdv_counter <= nios_fast_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = nios_fast_instruction_master_dbs_rdv_counter[1] & ~nios_fast_instruction_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_fast_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_instruction_master_address_last_time <= 0;
      else if (1)
          nios_fast_instruction_master_address_last_time <= nios_fast_instruction_master_address;
    end


  //nios_fast/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else if (1)
          active_and_waiting_last_time <= nios_fast_instruction_master_waitrequest & (nios_fast_instruction_master_read);
    end


  //nios_fast_instruction_master_address matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or nios_fast_instruction_master_address or nios_fast_instruction_master_address_last_time)
    begin
      if (active_and_waiting_last_time & (nios_fast_instruction_master_address != nios_fast_instruction_master_address_last_time))
        begin
          $write("%0d ns: nios_fast_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_fast_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_instruction_master_read_last_time <= 0;
      else if (1)
          nios_fast_instruction_master_read_last_time <= nios_fast_instruction_master_read;
    end


  //nios_fast_instruction_master_read matches last port_name, which is an e_process
  always @(active_and_waiting_last_time or nios_fast_instruction_master_read or nios_fast_instruction_master_read_last_time)
    begin
      if (active_and_waiting_last_time & (nios_fast_instruction_master_read != nios_fast_instruction_master_read_last_time))
        begin
          $write("%0d ns: nios_fast_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_16bit_0_avalon_slave_0_arbitrator (
                                                // inputs:
                                                 clk,
                                                 nios_fast_data_master_address_to_slave,
                                                 nios_fast_data_master_byteenable,
                                                 nios_fast_data_master_dbs_address,
                                                 nios_fast_data_master_dbs_write_16,
                                                 nios_fast_data_master_latency_counter,
                                                 nios_fast_data_master_read,
                                                 nios_fast_data_master_write,
                                                 nios_fast_instruction_master_address_to_slave,
                                                 nios_fast_instruction_master_dbs_address,
                                                 nios_fast_instruction_master_latency_counter,
                                                 nios_fast_instruction_master_read,
                                                 reset_n,
                                                 sram_16bit_0_avalon_slave_0_readdata,

                                                // outputs:
                                                 d1_sram_16bit_0_avalon_slave_0_end_xfer,
                                                 nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0,
                                                 nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0,
                                                 sram_16bit_0_avalon_slave_0_address,
                                                 sram_16bit_0_avalon_slave_0_byteenable_n,
                                                 sram_16bit_0_avalon_slave_0_chipselect_n,
                                                 sram_16bit_0_avalon_slave_0_read_n,
                                                 sram_16bit_0_avalon_slave_0_readdata_from_sa,
                                                 sram_16bit_0_avalon_slave_0_wait_counter_eq_0,
                                                 sram_16bit_0_avalon_slave_0_write_n,
                                                 sram_16bit_0_avalon_slave_0_writedata
                                              )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_sram_16bit_0_avalon_slave_0_end_xfer;
  output  [  1: 0] nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0;
  output           nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0;
  output           nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0;
  output           nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  output           nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0;
  output           nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0;
  output           nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0;
  output           nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  output           nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0;
  output  [ 17: 0] sram_16bit_0_avalon_slave_0_address;
  output  [  1: 0] sram_16bit_0_avalon_slave_0_byteenable_n;
  output           sram_16bit_0_avalon_slave_0_chipselect_n;
  output           sram_16bit_0_avalon_slave_0_read_n;
  output  [ 15: 0] sram_16bit_0_avalon_slave_0_readdata_from_sa;
  output           sram_16bit_0_avalon_slave_0_wait_counter_eq_0;
  output           sram_16bit_0_avalon_slave_0_write_n;
  output  [ 15: 0] sram_16bit_0_avalon_slave_0_writedata;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input   [  3: 0] nios_fast_data_master_byteenable;
  input   [  1: 0] nios_fast_data_master_dbs_address;
  input   [ 15: 0] nios_fast_data_master_dbs_write_16;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 23: 0] nios_fast_instruction_master_address_to_slave;
  input   [  1: 0] nios_fast_instruction_master_dbs_address;
  input            nios_fast_instruction_master_latency_counter;
  input            nios_fast_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sram_16bit_0_avalon_slave_0_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_sram_16bit_0_avalon_slave_0_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_16bit_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_nios_fast_data_master_granted_slave_sram_16bit_0_avalon_slave_0;
  reg              last_cycle_nios_fast_instruction_master_granted_slave_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire    [  1: 0] nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0;
  wire    [  1: 0] nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0_segment_0;
  wire    [  1: 0] nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0_segment_1;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_saved_grant_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_arbiterlock;
  wire             nios_fast_instruction_master_arbiterlock2;
  wire             nios_fast_instruction_master_continuerequest;
  wire             nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_saved_grant_sram_16bit_0_avalon_slave_0;
  wire    [ 23: 0] shifted_address_to_sram_16bit_0_avalon_slave_0_from_nios_fast_data_master;
  wire    [ 23: 0] shifted_address_to_sram_16bit_0_avalon_slave_0_from_nios_fast_instruction_master;
  wire    [ 17: 0] sram_16bit_0_avalon_slave_0_address;
  wire             sram_16bit_0_avalon_slave_0_allgrants;
  wire             sram_16bit_0_avalon_slave_0_allow_new_arb_cycle;
  wire             sram_16bit_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             sram_16bit_0_avalon_slave_0_any_continuerequest;
  reg     [  1: 0] sram_16bit_0_avalon_slave_0_arb_addend;
  wire             sram_16bit_0_avalon_slave_0_arb_counter_enable;
  reg     [  2: 0] sram_16bit_0_avalon_slave_0_arb_share_counter;
  wire    [  2: 0] sram_16bit_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  2: 0] sram_16bit_0_avalon_slave_0_arb_share_set_values;
  wire    [  1: 0] sram_16bit_0_avalon_slave_0_arb_winner;
  wire             sram_16bit_0_avalon_slave_0_arbitration_holdoff_internal;
  wire             sram_16bit_0_avalon_slave_0_beginbursttransfer_internal;
  wire             sram_16bit_0_avalon_slave_0_begins_xfer;
  wire    [  1: 0] sram_16bit_0_avalon_slave_0_byteenable_n;
  wire             sram_16bit_0_avalon_slave_0_chipselect_n;
  wire    [  3: 0] sram_16bit_0_avalon_slave_0_chosen_master_double_vector;
  wire    [  1: 0] sram_16bit_0_avalon_slave_0_chosen_master_rot_left;
  wire    [  2: 0] sram_16bit_0_avalon_slave_0_counter_load_value;
  wire             sram_16bit_0_avalon_slave_0_end_xfer;
  wire             sram_16bit_0_avalon_slave_0_firsttransfer;
  wire    [  1: 0] sram_16bit_0_avalon_slave_0_grant_vector;
  wire             sram_16bit_0_avalon_slave_0_in_a_read_cycle;
  wire             sram_16bit_0_avalon_slave_0_in_a_write_cycle;
  wire    [  1: 0] sram_16bit_0_avalon_slave_0_master_qreq_vector;
  wire             sram_16bit_0_avalon_slave_0_non_bursting_master_requests;
  wire             sram_16bit_0_avalon_slave_0_read_n;
  wire    [ 15: 0] sram_16bit_0_avalon_slave_0_readdata_from_sa;
  reg              sram_16bit_0_avalon_slave_0_reg_firsttransfer;
  reg     [  1: 0] sram_16bit_0_avalon_slave_0_saved_chosen_master_vector;
  reg              sram_16bit_0_avalon_slave_0_slavearbiterlockenable;
  wire             sram_16bit_0_avalon_slave_0_slavearbiterlockenable2;
  wire             sram_16bit_0_avalon_slave_0_unreg_firsttransfer;
  reg     [  2: 0] sram_16bit_0_avalon_slave_0_wait_counter;
  wire             sram_16bit_0_avalon_slave_0_wait_counter_eq_0;
  wire             sram_16bit_0_avalon_slave_0_waits_for_read;
  wire             sram_16bit_0_avalon_slave_0_waits_for_write;
  wire             sram_16bit_0_avalon_slave_0_write_n;
  wire    [ 15: 0] sram_16bit_0_avalon_slave_0_writedata;
  wire             wait_for_sram_16bit_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~sram_16bit_0_avalon_slave_0_end_xfer;
    end


  assign sram_16bit_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0 | nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0));
  //assign sram_16bit_0_avalon_slave_0_readdata_from_sa = sram_16bit_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_readdata_from_sa = sram_16bit_0_avalon_slave_0_readdata;

  assign nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0 = ({nios_fast_data_master_address_to_slave[23 : 19] , 19'b0} == 24'h880000) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //sram_16bit_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_arb_share_set_values = (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0)? 2 :
    (nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0)? 2 :
    (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0)? 2 :
    (nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0)? 2 :
    1;

  //sram_16bit_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_non_bursting_master_requests = nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0 |
    nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0 |
    nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0 |
    nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0;

  //sram_16bit_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //sram_16bit_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_arb_share_counter_next_value = sram_16bit_0_avalon_slave_0_firsttransfer ? (sram_16bit_0_avalon_slave_0_arb_share_set_values - 1) : |sram_16bit_0_avalon_slave_0_arb_share_counter ? (sram_16bit_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //sram_16bit_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_allgrants = |sram_16bit_0_avalon_slave_0_grant_vector |
    |sram_16bit_0_avalon_slave_0_grant_vector |
    |sram_16bit_0_avalon_slave_0_grant_vector |
    |sram_16bit_0_avalon_slave_0_grant_vector;

  //sram_16bit_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_end_xfer = ~(sram_16bit_0_avalon_slave_0_waits_for_read | sram_16bit_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_16bit_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_16bit_0_avalon_slave_0 = sram_16bit_0_avalon_slave_0_end_xfer & (~sram_16bit_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_16bit_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_16bit_0_avalon_slave_0 & sram_16bit_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_sram_16bit_0_avalon_slave_0 & ~sram_16bit_0_avalon_slave_0_non_bursting_master_requests);

  //sram_16bit_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_16bit_0_avalon_slave_0_arb_share_counter <= 0;
      else if (sram_16bit_0_avalon_slave_0_arb_counter_enable)
          sram_16bit_0_avalon_slave_0_arb_share_counter <= sram_16bit_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //sram_16bit_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_16bit_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|sram_16bit_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_sram_16bit_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_sram_16bit_0_avalon_slave_0 & ~sram_16bit_0_avalon_slave_0_non_bursting_master_requests))
          sram_16bit_0_avalon_slave_0_slavearbiterlockenable <= |sram_16bit_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //nios_fast/data_master sram_16bit_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = sram_16bit_0_avalon_slave_0_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //sram_16bit_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_slavearbiterlockenable2 = |sram_16bit_0_avalon_slave_0_arb_share_counter_next_value;

  //nios_fast/data_master sram_16bit_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = sram_16bit_0_avalon_slave_0_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //nios_fast/instruction_master sram_16bit_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock = sram_16bit_0_avalon_slave_0_slavearbiterlockenable & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master sram_16bit_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock2 = sram_16bit_0_avalon_slave_0_slavearbiterlockenable2 & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master granted sram_16bit_0/avalon_slave_0 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_instruction_master_granted_slave_sram_16bit_0_avalon_slave_0 <= 0;
      else if (1)
          last_cycle_nios_fast_instruction_master_granted_slave_sram_16bit_0_avalon_slave_0 <= nios_fast_instruction_master_saved_grant_sram_16bit_0_avalon_slave_0 ? 1 : (sram_16bit_0_avalon_slave_0_arbitration_holdoff_internal | ~nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0) ? 0 : last_cycle_nios_fast_instruction_master_granted_slave_sram_16bit_0_avalon_slave_0;
    end


  //nios_fast_instruction_master_continuerequest continued request, which is an e_mux
  assign nios_fast_instruction_master_continuerequest = last_cycle_nios_fast_instruction_master_granted_slave_sram_16bit_0_avalon_slave_0 & nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0;

  //sram_16bit_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_any_continuerequest = nios_fast_instruction_master_continuerequest |
    nios_fast_data_master_continuerequest;

  assign nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0 = nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0 & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))) | ((!nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0) & nios_fast_data_master_write) | nios_fast_instruction_master_arbiterlock);
  //local readdatavalid nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0, which is an e_mux
  assign nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0 = nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_read & ~sram_16bit_0_avalon_slave_0_waits_for_read;

  //sram_16bit_0_avalon_slave_0_writedata mux, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_writedata = nios_fast_data_master_dbs_write_16;

  assign nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0 = (({nios_fast_instruction_master_address_to_slave[23 : 19] , 19'b0} == 24'h880000) & (nios_fast_instruction_master_read)) & nios_fast_instruction_master_read;
  //nios_fast/data_master granted sram_16bit_0/avalon_slave_0 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_data_master_granted_slave_sram_16bit_0_avalon_slave_0 <= 0;
      else if (1)
          last_cycle_nios_fast_data_master_granted_slave_sram_16bit_0_avalon_slave_0 <= nios_fast_data_master_saved_grant_sram_16bit_0_avalon_slave_0 ? 1 : (sram_16bit_0_avalon_slave_0_arbitration_holdoff_internal | ~nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0) ? 0 : last_cycle_nios_fast_data_master_granted_slave_sram_16bit_0_avalon_slave_0;
    end


  //nios_fast_data_master_continuerequest continued request, which is an e_mux
  assign nios_fast_data_master_continuerequest = last_cycle_nios_fast_data_master_granted_slave_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0;

  assign nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0 = nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0 & ~((nios_fast_instruction_master_read & ((nios_fast_instruction_master_latency_counter != 0))) | nios_fast_data_master_arbiterlock);
  //local readdatavalid nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0, which is an e_mux
  assign nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0 = nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_instruction_master_read & ~sram_16bit_0_avalon_slave_0_waits_for_read;

  //allow new arb cycle for sram_16bit_0/avalon_slave_0, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_allow_new_arb_cycle = ~nios_fast_data_master_arbiterlock & ~nios_fast_instruction_master_arbiterlock;

  //nios_fast/instruction_master assignment into master qualified-requests vector for sram_16bit_0/avalon_slave_0, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_master_qreq_vector[0] = nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0;

  //nios_fast/instruction_master grant sram_16bit_0/avalon_slave_0, which is an e_assign
  assign nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 = sram_16bit_0_avalon_slave_0_grant_vector[0];

  //nios_fast/instruction_master saved-grant sram_16bit_0/avalon_slave_0, which is an e_assign
  assign nios_fast_instruction_master_saved_grant_sram_16bit_0_avalon_slave_0 = sram_16bit_0_avalon_slave_0_arb_winner[0] && nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0;

  //nios_fast/data_master assignment into master qualified-requests vector for sram_16bit_0/avalon_slave_0, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_master_qreq_vector[1] = nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0;

  //nios_fast/data_master grant sram_16bit_0/avalon_slave_0, which is an e_assign
  assign nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 = sram_16bit_0_avalon_slave_0_grant_vector[1];

  //nios_fast/data_master saved-grant sram_16bit_0/avalon_slave_0, which is an e_assign
  assign nios_fast_data_master_saved_grant_sram_16bit_0_avalon_slave_0 = sram_16bit_0_avalon_slave_0_arb_winner[1] && nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0;

  //sram_16bit_0/avalon_slave_0 chosen-master double-vector, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_chosen_master_double_vector = {sram_16bit_0_avalon_slave_0_master_qreq_vector, sram_16bit_0_avalon_slave_0_master_qreq_vector} & ({~sram_16bit_0_avalon_slave_0_master_qreq_vector, ~sram_16bit_0_avalon_slave_0_master_qreq_vector} + sram_16bit_0_avalon_slave_0_arb_addend);

  //stable onehot encoding of arb winner
  assign sram_16bit_0_avalon_slave_0_arb_winner = (sram_16bit_0_avalon_slave_0_allow_new_arb_cycle & | sram_16bit_0_avalon_slave_0_grant_vector) ? sram_16bit_0_avalon_slave_0_grant_vector : sram_16bit_0_avalon_slave_0_saved_chosen_master_vector;

  //saved sram_16bit_0_avalon_slave_0_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_16bit_0_avalon_slave_0_saved_chosen_master_vector <= 0;
      else if (sram_16bit_0_avalon_slave_0_allow_new_arb_cycle)
          sram_16bit_0_avalon_slave_0_saved_chosen_master_vector <= |sram_16bit_0_avalon_slave_0_grant_vector ? sram_16bit_0_avalon_slave_0_grant_vector : sram_16bit_0_avalon_slave_0_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sram_16bit_0_avalon_slave_0_grant_vector = {(sram_16bit_0_avalon_slave_0_chosen_master_double_vector[1] | sram_16bit_0_avalon_slave_0_chosen_master_double_vector[3]),
    (sram_16bit_0_avalon_slave_0_chosen_master_double_vector[0] | sram_16bit_0_avalon_slave_0_chosen_master_double_vector[2])};

  //sram_16bit_0/avalon_slave_0 chosen master rotated left, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_chosen_master_rot_left = (sram_16bit_0_avalon_slave_0_arb_winner << 1) ? (sram_16bit_0_avalon_slave_0_arb_winner << 1) : 1;

  //sram_16bit_0/avalon_slave_0's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_16bit_0_avalon_slave_0_arb_addend <= 1;
      else if (|sram_16bit_0_avalon_slave_0_grant_vector)
          sram_16bit_0_avalon_slave_0_arb_addend <= sram_16bit_0_avalon_slave_0_end_xfer? sram_16bit_0_avalon_slave_0_chosen_master_rot_left : sram_16bit_0_avalon_slave_0_grant_vector;
    end


  assign sram_16bit_0_avalon_slave_0_chipselect_n = ~(nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 | nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0);
  //sram_16bit_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_firsttransfer = sram_16bit_0_avalon_slave_0_begins_xfer ? sram_16bit_0_avalon_slave_0_unreg_firsttransfer : sram_16bit_0_avalon_slave_0_reg_firsttransfer;

  //sram_16bit_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_unreg_firsttransfer = ~(sram_16bit_0_avalon_slave_0_slavearbiterlockenable & sram_16bit_0_avalon_slave_0_any_continuerequest);

  //sram_16bit_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_16bit_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (sram_16bit_0_avalon_slave_0_begins_xfer)
          sram_16bit_0_avalon_slave_0_reg_firsttransfer <= sram_16bit_0_avalon_slave_0_unreg_firsttransfer;
    end


  //sram_16bit_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_beginbursttransfer_internal = sram_16bit_0_avalon_slave_0_begins_xfer;

  //sram_16bit_0_avalon_slave_0_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_arbitration_holdoff_internal = sram_16bit_0_avalon_slave_0_begins_xfer & sram_16bit_0_avalon_slave_0_firsttransfer;

  //~sram_16bit_0_avalon_slave_0_read_n assignment, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_read_n = ~(((nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_instruction_master_read))& ~sram_16bit_0_avalon_slave_0_begins_xfer & (sram_16bit_0_avalon_slave_0_wait_counter < 2));

  //~sram_16bit_0_avalon_slave_0_write_n assignment, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_write_n = ~(((nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_write)) & ~sram_16bit_0_avalon_slave_0_begins_xfer & (sram_16bit_0_avalon_slave_0_wait_counter >= 2) & (sram_16bit_0_avalon_slave_0_wait_counter < 4));

  assign shifted_address_to_sram_16bit_0_avalon_slave_0_from_nios_fast_data_master = {nios_fast_data_master_address_to_slave >> 2,
    nios_fast_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_16bit_0_avalon_slave_0_address mux, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_address = (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0)? (shifted_address_to_sram_16bit_0_avalon_slave_0_from_nios_fast_data_master >> 1) :
    (shifted_address_to_sram_16bit_0_avalon_slave_0_from_nios_fast_instruction_master >> 1);

  assign shifted_address_to_sram_16bit_0_avalon_slave_0_from_nios_fast_instruction_master = {nios_fast_instruction_master_address_to_slave >> 2,
    nios_fast_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sram_16bit_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_16bit_0_avalon_slave_0_end_xfer <= 1;
      else if (1)
          d1_sram_16bit_0_avalon_slave_0_end_xfer <= sram_16bit_0_avalon_slave_0_end_xfer;
    end


  //sram_16bit_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_waits_for_read = sram_16bit_0_avalon_slave_0_in_a_read_cycle & wait_for_sram_16bit_0_avalon_slave_0_counter;

  //sram_16bit_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_in_a_read_cycle = (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_16bit_0_avalon_slave_0_in_a_read_cycle;

  //sram_16bit_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_waits_for_write = sram_16bit_0_avalon_slave_0_in_a_write_cycle & wait_for_sram_16bit_0_avalon_slave_0_counter;

  //sram_16bit_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign sram_16bit_0_avalon_slave_0_in_a_write_cycle = nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_16bit_0_avalon_slave_0_in_a_write_cycle;

  assign sram_16bit_0_avalon_slave_0_wait_counter_eq_0 = sram_16bit_0_avalon_slave_0_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_16bit_0_avalon_slave_0_wait_counter <= 0;
      else if (1)
          sram_16bit_0_avalon_slave_0_wait_counter <= sram_16bit_0_avalon_slave_0_counter_load_value;
    end


  assign sram_16bit_0_avalon_slave_0_counter_load_value = ((sram_16bit_0_avalon_slave_0_in_a_read_cycle & sram_16bit_0_avalon_slave_0_begins_xfer))? 2 :
    ((sram_16bit_0_avalon_slave_0_in_a_write_cycle & sram_16bit_0_avalon_slave_0_begins_xfer))? 4 :
    (~sram_16bit_0_avalon_slave_0_wait_counter_eq_0)? sram_16bit_0_avalon_slave_0_wait_counter - 1 :
    0;

  assign wait_for_sram_16bit_0_avalon_slave_0_counter = sram_16bit_0_avalon_slave_0_begins_xfer | ~sram_16bit_0_avalon_slave_0_wait_counter_eq_0;
  //~sram_16bit_0_avalon_slave_0_byteenable_n byte enable port mux, which is an e_mux
  assign sram_16bit_0_avalon_slave_0_byteenable_n = ~((nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0)? nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0 :
    -1);

  assign {nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0_segment_1,
nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0_segment_0} = nios_fast_data_master_byteenable;
  assign nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0 = ((nios_fast_data_master_dbs_address[1] == 0))? nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0_segment_0 :
    nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram_16bit_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0 + nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_saved_grant_sram_16bit_0_avalon_slave_0 + nios_fast_instruction_master_saved_grant_sram_16bit_0_avalon_slave_0 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_timer_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  nios_fast_data_master_address_to_slave,
                                  nios_fast_data_master_latency_counter,
                                  nios_fast_data_master_read,
                                  nios_fast_data_master_write,
                                  nios_fast_data_master_writedata,
                                  reset_n,
                                  sys_timer_s1_irq,
                                  sys_timer_s1_readdata,

                                 // outputs:
                                  d1_sys_timer_s1_end_xfer,
                                  nios_fast_data_master_granted_sys_timer_s1,
                                  nios_fast_data_master_qualified_request_sys_timer_s1,
                                  nios_fast_data_master_read_data_valid_sys_timer_s1,
                                  nios_fast_data_master_requests_sys_timer_s1,
                                  sys_timer_s1_address,
                                  sys_timer_s1_chipselect,
                                  sys_timer_s1_irq_from_sa,
                                  sys_timer_s1_readdata_from_sa,
                                  sys_timer_s1_reset_n,
                                  sys_timer_s1_write_n,
                                  sys_timer_s1_writedata
                               )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output           d1_sys_timer_s1_end_xfer;
  output           nios_fast_data_master_granted_sys_timer_s1;
  output           nios_fast_data_master_qualified_request_sys_timer_s1;
  output           nios_fast_data_master_read_data_valid_sys_timer_s1;
  output           nios_fast_data_master_requests_sys_timer_s1;
  output  [  2: 0] sys_timer_s1_address;
  output           sys_timer_s1_chipselect;
  output           sys_timer_s1_irq_from_sa;
  output  [ 15: 0] sys_timer_s1_readdata_from_sa;
  output           sys_timer_s1_reset_n;
  output           sys_timer_s1_write_n;
  output  [ 15: 0] sys_timer_s1_writedata;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 31: 0] nios_fast_data_master_writedata;
  input            reset_n;
  input            sys_timer_s1_irq;
  input   [ 15: 0] sys_timer_s1_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_sys_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sys_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_sys_timer_s1;
  wire             nios_fast_data_master_qualified_request_sys_timer_s1;
  wire             nios_fast_data_master_read_data_valid_sys_timer_s1;
  wire             nios_fast_data_master_requests_sys_timer_s1;
  wire             nios_fast_data_master_saved_grant_sys_timer_s1;
  wire    [ 23: 0] shifted_address_to_sys_timer_s1_from_nios_fast_data_master;
  wire    [  2: 0] sys_timer_s1_address;
  wire             sys_timer_s1_allgrants;
  wire             sys_timer_s1_allow_new_arb_cycle;
  wire             sys_timer_s1_any_bursting_master_saved_grant;
  wire             sys_timer_s1_any_continuerequest;
  wire             sys_timer_s1_arb_counter_enable;
  reg     [  2: 0] sys_timer_s1_arb_share_counter;
  wire    [  2: 0] sys_timer_s1_arb_share_counter_next_value;
  wire    [  2: 0] sys_timer_s1_arb_share_set_values;
  wire             sys_timer_s1_beginbursttransfer_internal;
  wire             sys_timer_s1_begins_xfer;
  wire             sys_timer_s1_chipselect;
  wire             sys_timer_s1_end_xfer;
  wire             sys_timer_s1_firsttransfer;
  wire             sys_timer_s1_grant_vector;
  wire             sys_timer_s1_in_a_read_cycle;
  wire             sys_timer_s1_in_a_write_cycle;
  wire             sys_timer_s1_irq_from_sa;
  wire             sys_timer_s1_master_qreq_vector;
  wire             sys_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] sys_timer_s1_readdata_from_sa;
  reg              sys_timer_s1_reg_firsttransfer;
  wire             sys_timer_s1_reset_n;
  reg              sys_timer_s1_slavearbiterlockenable;
  wire             sys_timer_s1_slavearbiterlockenable2;
  wire             sys_timer_s1_unreg_firsttransfer;
  wire             sys_timer_s1_waits_for_read;
  wire             sys_timer_s1_waits_for_write;
  wire             sys_timer_s1_write_n;
  wire    [ 15: 0] sys_timer_s1_writedata;
  wire             wait_for_sys_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~sys_timer_s1_end_xfer;
    end


  assign sys_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_sys_timer_s1));
  //assign sys_timer_s1_readdata_from_sa = sys_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_timer_s1_readdata_from_sa = sys_timer_s1_readdata;

  assign nios_fast_data_master_requests_sys_timer_s1 = ({nios_fast_data_master_address_to_slave[23 : 5] , 5'b0} == 24'h902000) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //sys_timer_s1_arb_share_counter set values, which is an e_mux
  assign sys_timer_s1_arb_share_set_values = 1;

  //sys_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign sys_timer_s1_non_bursting_master_requests = nios_fast_data_master_requests_sys_timer_s1;

  //sys_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sys_timer_s1_any_bursting_master_saved_grant = 0;

  //sys_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sys_timer_s1_arb_share_counter_next_value = sys_timer_s1_firsttransfer ? (sys_timer_s1_arb_share_set_values - 1) : |sys_timer_s1_arb_share_counter ? (sys_timer_s1_arb_share_counter - 1) : 0;

  //sys_timer_s1_allgrants all slave grants, which is an e_mux
  assign sys_timer_s1_allgrants = |sys_timer_s1_grant_vector;

  //sys_timer_s1_end_xfer assignment, which is an e_assign
  assign sys_timer_s1_end_xfer = ~(sys_timer_s1_waits_for_read | sys_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sys_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sys_timer_s1 = sys_timer_s1_end_xfer & (~sys_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sys_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sys_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sys_timer_s1 & sys_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_sys_timer_s1 & ~sys_timer_s1_non_bursting_master_requests);

  //sys_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_timer_s1_arb_share_counter <= 0;
      else if (sys_timer_s1_arb_counter_enable)
          sys_timer_s1_arb_share_counter <= sys_timer_s1_arb_share_counter_next_value;
    end


  //sys_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_timer_s1_slavearbiterlockenable <= 0;
      else if ((|sys_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sys_timer_s1) | (end_xfer_arb_share_counter_term_sys_timer_s1 & ~sys_timer_s1_non_bursting_master_requests))
          sys_timer_s1_slavearbiterlockenable <= |sys_timer_s1_arb_share_counter_next_value;
    end


  //nios_fast/data_master sys_timer/s1 arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = sys_timer_s1_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //sys_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sys_timer_s1_slavearbiterlockenable2 = |sys_timer_s1_arb_share_counter_next_value;

  //nios_fast/data_master sys_timer/s1 arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = sys_timer_s1_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //sys_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sys_timer_s1_any_continuerequest = 1;

  //nios_fast_data_master_continuerequest continued request, which is an e_assign
  assign nios_fast_data_master_continuerequest = 1;

  assign nios_fast_data_master_qualified_request_sys_timer_s1 = nios_fast_data_master_requests_sys_timer_s1 & ~((nios_fast_data_master_read & ((nios_fast_data_master_latency_counter != 0))));
  //local readdatavalid nios_fast_data_master_read_data_valid_sys_timer_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_sys_timer_s1 = nios_fast_data_master_granted_sys_timer_s1 & nios_fast_data_master_read & ~sys_timer_s1_waits_for_read;

  //sys_timer_s1_writedata mux, which is an e_mux
  assign sys_timer_s1_writedata = nios_fast_data_master_writedata;

  //master is always granted when requested
  assign nios_fast_data_master_granted_sys_timer_s1 = nios_fast_data_master_qualified_request_sys_timer_s1;

  //nios_fast/data_master saved-grant sys_timer/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_sys_timer_s1 = nios_fast_data_master_requests_sys_timer_s1;

  //allow new arb cycle for sys_timer/s1, which is an e_assign
  assign sys_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sys_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sys_timer_s1_master_qreq_vector = 1;

  //sys_timer_s1_reset_n assignment, which is an e_assign
  assign sys_timer_s1_reset_n = reset_n;

  assign sys_timer_s1_chipselect = nios_fast_data_master_granted_sys_timer_s1;
  //sys_timer_s1_firsttransfer first transaction, which is an e_assign
  assign sys_timer_s1_firsttransfer = sys_timer_s1_begins_xfer ? sys_timer_s1_unreg_firsttransfer : sys_timer_s1_reg_firsttransfer;

  //sys_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sys_timer_s1_unreg_firsttransfer = ~(sys_timer_s1_slavearbiterlockenable & sys_timer_s1_any_continuerequest);

  //sys_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_timer_s1_reg_firsttransfer <= 1'b1;
      else if (sys_timer_s1_begins_xfer)
          sys_timer_s1_reg_firsttransfer <= sys_timer_s1_unreg_firsttransfer;
    end


  //sys_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sys_timer_s1_beginbursttransfer_internal = sys_timer_s1_begins_xfer;

  //~sys_timer_s1_write_n assignment, which is an e_mux
  assign sys_timer_s1_write_n = ~(nios_fast_data_master_granted_sys_timer_s1 & nios_fast_data_master_write);

  assign shifted_address_to_sys_timer_s1_from_nios_fast_data_master = nios_fast_data_master_address_to_slave;
  //sys_timer_s1_address mux, which is an e_mux
  assign sys_timer_s1_address = shifted_address_to_sys_timer_s1_from_nios_fast_data_master >> 2;

  //d1_sys_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sys_timer_s1_end_xfer <= 1;
      else if (1)
          d1_sys_timer_s1_end_xfer <= sys_timer_s1_end_xfer;
    end


  //sys_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign sys_timer_s1_waits_for_read = sys_timer_s1_in_a_read_cycle & sys_timer_s1_begins_xfer;

  //sys_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign sys_timer_s1_in_a_read_cycle = nios_fast_data_master_granted_sys_timer_s1 & nios_fast_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sys_timer_s1_in_a_read_cycle;

  //sys_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign sys_timer_s1_waits_for_write = sys_timer_s1_in_a_write_cycle & 0;

  //sys_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign sys_timer_s1_in_a_write_cycle = nios_fast_data_master_granted_sys_timer_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sys_timer_s1_in_a_write_cycle;

  assign wait_for_sys_timer_s1_counter = 0;
  //assign sys_timer_s1_irq_from_sa = sys_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_timer_s1_irq_from_sa = sys_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sys_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tristate_bridge_avalon_slave_arbitrator (
                                                 // inputs:
                                                  clk,
                                                  nios_fast_data_master_address_to_slave,
                                                  nios_fast_data_master_byteenable,
                                                  nios_fast_data_master_dbs_address,
                                                  nios_fast_data_master_dbs_write_8,
                                                  nios_fast_data_master_latency_counter,
                                                  nios_fast_data_master_read,
                                                  nios_fast_data_master_write,
                                                  nios_fast_instruction_master_address_to_slave,
                                                  nios_fast_instruction_master_dbs_address,
                                                  nios_fast_instruction_master_latency_counter,
                                                  nios_fast_instruction_master_read,
                                                  reset_n,

                                                 // outputs:
                                                  address_to_the_cfi_flash,
                                                  cfi_flash_s1_wait_counter_eq_0,
                                                  d1_tristate_bridge_avalon_slave_end_xfer,
                                                  data_to_and_from_the_cfi_flash,
                                                  incoming_data_to_and_from_the_cfi_flash,
                                                  incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                                  nios_fast_data_master_byteenable_cfi_flash_s1,
                                                  nios_fast_data_master_granted_cfi_flash_s1,
                                                  nios_fast_data_master_qualified_request_cfi_flash_s1,
                                                  nios_fast_data_master_read_data_valid_cfi_flash_s1,
                                                  nios_fast_data_master_requests_cfi_flash_s1,
                                                  nios_fast_instruction_master_granted_cfi_flash_s1,
                                                  nios_fast_instruction_master_qualified_request_cfi_flash_s1,
                                                  nios_fast_instruction_master_read_data_valid_cfi_flash_s1,
                                                  nios_fast_instruction_master_requests_cfi_flash_s1,
                                                  read_n_to_the_cfi_flash,
                                                  select_n_to_the_cfi_flash,
                                                  write_n_to_the_cfi_flash
                                               )
  /* synthesis auto_dissolve = "FALSE" */ ;

  output  [ 21: 0] address_to_the_cfi_flash;
  output           cfi_flash_s1_wait_counter_eq_0;
  output           d1_tristate_bridge_avalon_slave_end_xfer;
  inout   [  7: 0] data_to_and_from_the_cfi_flash;
  output  [  7: 0] incoming_data_to_and_from_the_cfi_flash;
  output  [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  output           nios_fast_data_master_byteenable_cfi_flash_s1;
  output           nios_fast_data_master_granted_cfi_flash_s1;
  output           nios_fast_data_master_qualified_request_cfi_flash_s1;
  output           nios_fast_data_master_read_data_valid_cfi_flash_s1;
  output           nios_fast_data_master_requests_cfi_flash_s1;
  output           nios_fast_instruction_master_granted_cfi_flash_s1;
  output           nios_fast_instruction_master_qualified_request_cfi_flash_s1;
  output           nios_fast_instruction_master_read_data_valid_cfi_flash_s1;
  output           nios_fast_instruction_master_requests_cfi_flash_s1;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           write_n_to_the_cfi_flash;
  input            clk;
  input   [ 23: 0] nios_fast_data_master_address_to_slave;
  input   [  3: 0] nios_fast_data_master_byteenable;
  input   [  1: 0] nios_fast_data_master_dbs_address;
  input   [  7: 0] nios_fast_data_master_dbs_write_8;
  input            nios_fast_data_master_latency_counter;
  input            nios_fast_data_master_read;
  input            nios_fast_data_master_write;
  input   [ 23: 0] nios_fast_instruction_master_address_to_slave;
  input   [  1: 0] nios_fast_instruction_master_dbs_address;
  input            nios_fast_instruction_master_latency_counter;
  input            nios_fast_instruction_master_read;
  input            reset_n;

  reg     [ 21: 0] address_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  4: 0] cfi_flash_s1_counter_load_value;
  wire             cfi_flash_s1_in_a_read_cycle;
  wire             cfi_flash_s1_in_a_write_cycle;
  wire             cfi_flash_s1_pretend_byte_enable;
  reg     [  4: 0] cfi_flash_s1_wait_counter;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_waits_for_read;
  wire             cfi_flash_s1_waits_for_write;
  wire             cfi_flash_s1_with_write_latency;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [  7: 0] d1_outgoing_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tristate_bridge_avalon_slave_end_xfer;
  wire    [  7: 0] data_to_and_from_the_cfi_flash;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  7: 0] incoming_data_to_and_from_the_cfi_flash;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_0_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_1_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_2_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_3_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_4_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_5_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_6_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_7_is_x;
  wire    [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  reg              last_cycle_nios_fast_data_master_granted_slave_cfi_flash_s1;
  reg              last_cycle_nios_fast_instruction_master_granted_slave_cfi_flash_s1;
  wire             nios_fast_data_master_arbiterlock;
  wire             nios_fast_data_master_arbiterlock2;
  wire             nios_fast_data_master_byteenable_cfi_flash_s1;
  wire             nios_fast_data_master_byteenable_cfi_flash_s1_segment_0;
  wire             nios_fast_data_master_byteenable_cfi_flash_s1_segment_1;
  wire             nios_fast_data_master_byteenable_cfi_flash_s1_segment_2;
  wire             nios_fast_data_master_byteenable_cfi_flash_s1_segment_3;
  wire             nios_fast_data_master_continuerequest;
  wire             nios_fast_data_master_granted_cfi_flash_s1;
  wire             nios_fast_data_master_qualified_request_cfi_flash_s1;
  wire             nios_fast_data_master_read_data_valid_cfi_flash_s1;
  reg              nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             nios_fast_data_master_requests_cfi_flash_s1;
  wire             nios_fast_data_master_saved_grant_cfi_flash_s1;
  wire             nios_fast_instruction_master_arbiterlock;
  wire             nios_fast_instruction_master_arbiterlock2;
  wire             nios_fast_instruction_master_continuerequest;
  wire             nios_fast_instruction_master_granted_cfi_flash_s1;
  wire             nios_fast_instruction_master_qualified_request_cfi_flash_s1;
  wire             nios_fast_instruction_master_read_data_valid_cfi_flash_s1;
  reg              nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             nios_fast_instruction_master_requests_cfi_flash_s1;
  wire             nios_fast_instruction_master_saved_grant_cfi_flash_s1;
  wire    [  7: 0] outgoing_data_to_and_from_the_cfi_flash;
  wire    [ 21: 0] p1_address_to_the_cfi_flash;
  wire             p1_nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash;
  wire             p1_select_n_to_the_cfi_flash;
  wire             p1_write_n_to_the_cfi_flash;
  reg              read_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             tristate_bridge_avalon_slave_allgrants;
  wire             tristate_bridge_avalon_slave_allow_new_arb_cycle;
  wire             tristate_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             tristate_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] tristate_bridge_avalon_slave_arb_addend;
  wire             tristate_bridge_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tristate_bridge_avalon_slave_arb_share_counter;
  wire    [  2: 0] tristate_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tristate_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tristate_bridge_avalon_slave_arb_winner;
  wire             tristate_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             tristate_bridge_avalon_slave_beginbursttransfer_internal;
  wire             tristate_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] tristate_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tristate_bridge_avalon_slave_chosen_master_rot_left;
  wire             tristate_bridge_avalon_slave_end_xfer;
  wire             tristate_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] tristate_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] tristate_bridge_avalon_slave_master_qreq_vector;
  wire             tristate_bridge_avalon_slave_non_bursting_master_requests;
  wire             tristate_bridge_avalon_slave_read_pending;
  reg              tristate_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tristate_bridge_avalon_slave_saved_chosen_master_vector;
  reg              tristate_bridge_avalon_slave_slavearbiterlockenable;
  wire             tristate_bridge_avalon_slave_slavearbiterlockenable2;
  wire             tristate_bridge_avalon_slave_unreg_firsttransfer;
  wire             tristate_bridge_avalon_slave_write_pending;
  wire             wait_for_cfi_flash_s1_counter;
  reg              write_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else if (1)
          d1_reasons_to_wait <= ~tristate_bridge_avalon_slave_end_xfer;
    end


  assign tristate_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((nios_fast_data_master_qualified_request_cfi_flash_s1 | nios_fast_instruction_master_qualified_request_cfi_flash_s1));
  assign nios_fast_data_master_requests_cfi_flash_s1 = ({nios_fast_data_master_address_to_slave[23 : 22] , 22'b0} == 24'h400000) & (nios_fast_data_master_read | nios_fast_data_master_write);
  //~select_n_to_the_cfi_flash of type chipselect to ~p1_select_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash <= ~0;
      else if (1)
          select_n_to_the_cfi_flash <= p1_select_n_to_the_cfi_flash;
    end


  assign tristate_bridge_avalon_slave_write_pending = 0;
  //tristate_bridge/avalon_slave read pending calc, which is an e_assign
  assign tristate_bridge_avalon_slave_read_pending = 0;

  //tristate_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tristate_bridge_avalon_slave_arb_share_set_values = (nios_fast_data_master_granted_cfi_flash_s1)? 4 :
    (nios_fast_instruction_master_granted_cfi_flash_s1)? 4 :
    (nios_fast_data_master_granted_cfi_flash_s1)? 4 :
    (nios_fast_instruction_master_granted_cfi_flash_s1)? 4 :
    1;

  //tristate_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tristate_bridge_avalon_slave_non_bursting_master_requests = nios_fast_data_master_requests_cfi_flash_s1 |
    nios_fast_instruction_master_requests_cfi_flash_s1 |
    nios_fast_data_master_requests_cfi_flash_s1 |
    nios_fast_instruction_master_requests_cfi_flash_s1;

  //tristate_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tristate_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //tristate_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tristate_bridge_avalon_slave_arb_share_counter_next_value = tristate_bridge_avalon_slave_firsttransfer ? (tristate_bridge_avalon_slave_arb_share_set_values - 1) : |tristate_bridge_avalon_slave_arb_share_counter ? (tristate_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //tristate_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tristate_bridge_avalon_slave_allgrants = |tristate_bridge_avalon_slave_grant_vector |
    |tristate_bridge_avalon_slave_grant_vector |
    |tristate_bridge_avalon_slave_grant_vector |
    |tristate_bridge_avalon_slave_grant_vector;

  //tristate_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign tristate_bridge_avalon_slave_end_xfer = ~(cfi_flash_s1_waits_for_read | cfi_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave = tristate_bridge_avalon_slave_end_xfer & (~tristate_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tristate_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tristate_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & tristate_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & ~tristate_bridge_avalon_slave_non_bursting_master_requests);

  //tristate_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_arb_share_counter <= 0;
      else if (tristate_bridge_avalon_slave_arb_counter_enable)
          tristate_bridge_avalon_slave_arb_share_counter <= tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //tristate_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tristate_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_tristate_bridge_avalon_slave & ~tristate_bridge_avalon_slave_non_bursting_master_requests))
          tristate_bridge_avalon_slave_slavearbiterlockenable <= |tristate_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //nios_fast/data_master tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign nios_fast_data_master_arbiterlock = tristate_bridge_avalon_slave_slavearbiterlockenable & nios_fast_data_master_continuerequest;

  //tristate_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tristate_bridge_avalon_slave_slavearbiterlockenable2 = |tristate_bridge_avalon_slave_arb_share_counter_next_value;

  //nios_fast/data_master tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign nios_fast_data_master_arbiterlock2 = tristate_bridge_avalon_slave_slavearbiterlockenable2 & nios_fast_data_master_continuerequest;

  //nios_fast/instruction_master tristate_bridge/avalon_slave arbiterlock, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock = tristate_bridge_avalon_slave_slavearbiterlockenable & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master tristate_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign nios_fast_instruction_master_arbiterlock2 = tristate_bridge_avalon_slave_slavearbiterlockenable2 & nios_fast_instruction_master_continuerequest;

  //nios_fast/instruction_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_instruction_master_granted_slave_cfi_flash_s1 <= 0;
      else if (1)
          last_cycle_nios_fast_instruction_master_granted_slave_cfi_flash_s1 <= nios_fast_instruction_master_saved_grant_cfi_flash_s1 ? 1 : (tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~nios_fast_instruction_master_requests_cfi_flash_s1) ? 0 : last_cycle_nios_fast_instruction_master_granted_slave_cfi_flash_s1;
    end


  //nios_fast_instruction_master_continuerequest continued request, which is an e_mux
  assign nios_fast_instruction_master_continuerequest = last_cycle_nios_fast_instruction_master_granted_slave_cfi_flash_s1 & nios_fast_instruction_master_requests_cfi_flash_s1;

  //tristate_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tristate_bridge_avalon_slave_any_continuerequest = nios_fast_instruction_master_continuerequest |
    nios_fast_data_master_continuerequest;

  assign nios_fast_data_master_qualified_request_cfi_flash_s1 = nios_fast_data_master_requests_cfi_flash_s1 & ~((nios_fast_data_master_read & (tristate_bridge_avalon_slave_write_pending | (tristate_bridge_avalon_slave_read_pending) | (1 < nios_fast_data_master_latency_counter))) | ((tristate_bridge_avalon_slave_read_pending | !nios_fast_data_master_byteenable_cfi_flash_s1) & nios_fast_data_master_write) | nios_fast_instruction_master_arbiterlock);
  //nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register_in = nios_fast_data_master_granted_cfi_flash_s1 & nios_fast_data_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register = {nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register, nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else if (1)
          nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register <= p1_nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid nios_fast_data_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign nios_fast_data_master_read_data_valid_cfi_flash_s1 = nios_fast_data_master_read_data_valid_cfi_flash_s1_shift_register;

  //data_to_and_from_the_cfi_flash assignment, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash = data_to_and_from_the_cfi_flash;

  //cfi_flash_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_s1_with_write_latency = in_a_write_cycle & (nios_fast_data_master_qualified_request_cfi_flash_s1 | nios_fast_instruction_master_qualified_request_cfi_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_cfi_flash <= 0;
      else if (1)
          d1_outgoing_data_to_and_from_the_cfi_flash <= outgoing_data_to_and_from_the_cfi_flash;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else if (1)
          d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_cfi_flash tristate driver, which is an e_assign
  assign data_to_and_from_the_cfi_flash = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_cfi_flash:{8{1'bz}};

  //outgoing_data_to_and_from_the_cfi_flash mux, which is an e_mux
  assign outgoing_data_to_and_from_the_cfi_flash = nios_fast_data_master_dbs_write_8;

  assign nios_fast_instruction_master_requests_cfi_flash_s1 = (({nios_fast_instruction_master_address_to_slave[23 : 22] , 22'b0} == 24'h400000) & (nios_fast_instruction_master_read)) & nios_fast_instruction_master_read;
  //nios_fast/data_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_nios_fast_data_master_granted_slave_cfi_flash_s1 <= 0;
      else if (1)
          last_cycle_nios_fast_data_master_granted_slave_cfi_flash_s1 <= nios_fast_data_master_saved_grant_cfi_flash_s1 ? 1 : (tristate_bridge_avalon_slave_arbitration_holdoff_internal | ~nios_fast_data_master_requests_cfi_flash_s1) ? 0 : last_cycle_nios_fast_data_master_granted_slave_cfi_flash_s1;
    end


  //nios_fast_data_master_continuerequest continued request, which is an e_mux
  assign nios_fast_data_master_continuerequest = last_cycle_nios_fast_data_master_granted_slave_cfi_flash_s1 & nios_fast_data_master_requests_cfi_flash_s1;

  assign nios_fast_instruction_master_qualified_request_cfi_flash_s1 = nios_fast_instruction_master_requests_cfi_flash_s1 & ~((nios_fast_instruction_master_read & (tristate_bridge_avalon_slave_write_pending | (tristate_bridge_avalon_slave_read_pending) | (1 < nios_fast_instruction_master_latency_counter))) | nios_fast_data_master_arbiterlock);
  //nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in = nios_fast_instruction_master_granted_cfi_flash_s1 & nios_fast_instruction_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register = {nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register, nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else if (1)
          nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= p1_nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid nios_fast_instruction_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign nios_fast_instruction_master_read_data_valid_cfi_flash_s1 = nios_fast_instruction_master_read_data_valid_cfi_flash_s1_shift_register;

  //allow new arb cycle for tristate_bridge/avalon_slave, which is an e_assign
  assign tristate_bridge_avalon_slave_allow_new_arb_cycle = ~nios_fast_data_master_arbiterlock & ~nios_fast_instruction_master_arbiterlock;

  //nios_fast/instruction_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tristate_bridge_avalon_slave_master_qreq_vector[0] = nios_fast_instruction_master_qualified_request_cfi_flash_s1;

  //nios_fast/instruction_master grant cfi_flash/s1, which is an e_assign
  assign nios_fast_instruction_master_granted_cfi_flash_s1 = tristate_bridge_avalon_slave_grant_vector[0];

  //nios_fast/instruction_master saved-grant cfi_flash/s1, which is an e_assign
  assign nios_fast_instruction_master_saved_grant_cfi_flash_s1 = tristate_bridge_avalon_slave_arb_winner[0] && nios_fast_instruction_master_requests_cfi_flash_s1;

  //nios_fast/data_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tristate_bridge_avalon_slave_master_qreq_vector[1] = nios_fast_data_master_qualified_request_cfi_flash_s1;

  //nios_fast/data_master grant cfi_flash/s1, which is an e_assign
  assign nios_fast_data_master_granted_cfi_flash_s1 = tristate_bridge_avalon_slave_grant_vector[1];

  //nios_fast/data_master saved-grant cfi_flash/s1, which is an e_assign
  assign nios_fast_data_master_saved_grant_cfi_flash_s1 = tristate_bridge_avalon_slave_arb_winner[1] && nios_fast_data_master_requests_cfi_flash_s1;

  //tristate_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign tristate_bridge_avalon_slave_chosen_master_double_vector = {tristate_bridge_avalon_slave_master_qreq_vector, tristate_bridge_avalon_slave_master_qreq_vector} & ({~tristate_bridge_avalon_slave_master_qreq_vector, ~tristate_bridge_avalon_slave_master_qreq_vector} + tristate_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tristate_bridge_avalon_slave_arb_winner = (tristate_bridge_avalon_slave_allow_new_arb_cycle & | tristate_bridge_avalon_slave_grant_vector) ? tristate_bridge_avalon_slave_grant_vector : tristate_bridge_avalon_slave_saved_chosen_master_vector;

  //saved tristate_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tristate_bridge_avalon_slave_allow_new_arb_cycle)
          tristate_bridge_avalon_slave_saved_chosen_master_vector <= |tristate_bridge_avalon_slave_grant_vector ? tristate_bridge_avalon_slave_grant_vector : tristate_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tristate_bridge_avalon_slave_grant_vector = {(tristate_bridge_avalon_slave_chosen_master_double_vector[1] | tristate_bridge_avalon_slave_chosen_master_double_vector[3]),
    (tristate_bridge_avalon_slave_chosen_master_double_vector[0] | tristate_bridge_avalon_slave_chosen_master_double_vector[2])};

  //tristate_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign tristate_bridge_avalon_slave_chosen_master_rot_left = (tristate_bridge_avalon_slave_arb_winner << 1) ? (tristate_bridge_avalon_slave_arb_winner << 1) : 1;

  //tristate_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_arb_addend <= 1;
      else if (|tristate_bridge_avalon_slave_grant_vector)
          tristate_bridge_avalon_slave_arb_addend <= tristate_bridge_avalon_slave_end_xfer? tristate_bridge_avalon_slave_chosen_master_rot_left : tristate_bridge_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash = ~(nios_fast_data_master_granted_cfi_flash_s1 | nios_fast_instruction_master_granted_cfi_flash_s1);
  //tristate_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tristate_bridge_avalon_slave_firsttransfer = tristate_bridge_avalon_slave_begins_xfer ? tristate_bridge_avalon_slave_unreg_firsttransfer : tristate_bridge_avalon_slave_reg_firsttransfer;

  //tristate_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tristate_bridge_avalon_slave_unreg_firsttransfer = ~(tristate_bridge_avalon_slave_slavearbiterlockenable & tristate_bridge_avalon_slave_any_continuerequest);

  //tristate_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tristate_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tristate_bridge_avalon_slave_begins_xfer)
          tristate_bridge_avalon_slave_reg_firsttransfer <= tristate_bridge_avalon_slave_unreg_firsttransfer;
    end


  //tristate_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tristate_bridge_avalon_slave_beginbursttransfer_internal = tristate_bridge_avalon_slave_begins_xfer;

  //tristate_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tristate_bridge_avalon_slave_arbitration_holdoff_internal = tristate_bridge_avalon_slave_begins_xfer & tristate_bridge_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash of type read to ~p1_read_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash <= ~0;
      else if (1)
          read_n_to_the_cfi_flash <= p1_read_n_to_the_cfi_flash;
    end


  //~p1_read_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash = ~(((nios_fast_data_master_granted_cfi_flash_s1 & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_cfi_flash_s1 & nios_fast_instruction_master_read))& ~tristate_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter < 13));

  //~write_n_to_the_cfi_flash of type write to ~p1_write_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash <= ~0;
      else if (1)
          write_n_to_the_cfi_flash <= p1_write_n_to_the_cfi_flash;
    end


  //~p1_write_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash = ~(((nios_fast_data_master_granted_cfi_flash_s1 & nios_fast_data_master_write)) & ~tristate_bridge_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter >= 4) & (cfi_flash_s1_wait_counter < 17) & cfi_flash_s1_pretend_byte_enable);

  //address_to_the_cfi_flash of type address to p1_address_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_cfi_flash <= 0;
      else if (1)
          address_to_the_cfi_flash <= p1_address_to_the_cfi_flash;
    end


  //p1_address_to_the_cfi_flash mux, which is an e_mux
  assign p1_address_to_the_cfi_flash = (nios_fast_data_master_granted_cfi_flash_s1)? ({nios_fast_data_master_address_to_slave >> 2,
    nios_fast_data_master_dbs_address[1 : 0]}) :
    ({nios_fast_instruction_master_address_to_slave >> 2,
    nios_fast_instruction_master_dbs_address[1 : 0]});

  //d1_tristate_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tristate_bridge_avalon_slave_end_xfer <= 1;
      else if (1)
          d1_tristate_bridge_avalon_slave_end_xfer <= tristate_bridge_avalon_slave_end_xfer;
    end


  //cfi_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_read = cfi_flash_s1_in_a_read_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_read_cycle = (nios_fast_data_master_granted_cfi_flash_s1 & nios_fast_data_master_read) | (nios_fast_instruction_master_granted_cfi_flash_s1 & nios_fast_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_s1_in_a_read_cycle;

  //cfi_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_write = cfi_flash_s1_in_a_write_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_write_cycle = nios_fast_data_master_granted_cfi_flash_s1 & nios_fast_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_s1_in_a_write_cycle;

  assign cfi_flash_s1_wait_counter_eq_0 = cfi_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_s1_wait_counter <= 0;
      else if (1)
          cfi_flash_s1_wait_counter <= cfi_flash_s1_counter_load_value;
    end


  assign cfi_flash_s1_counter_load_value = ((cfi_flash_s1_in_a_read_cycle & tristate_bridge_avalon_slave_begins_xfer))? 15 :
    ((cfi_flash_s1_in_a_write_cycle & tristate_bridge_avalon_slave_begins_xfer))? 19 :
    (~cfi_flash_s1_wait_counter_eq_0)? cfi_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_s1_counter = tristate_bridge_avalon_slave_begins_xfer | ~cfi_flash_s1_wait_counter_eq_0;
  //cfi_flash_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign cfi_flash_s1_pretend_byte_enable = (nios_fast_data_master_granted_cfi_flash_s1)? nios_fast_data_master_byteenable_cfi_flash_s1 :
    -1;

  assign {nios_fast_data_master_byteenable_cfi_flash_s1_segment_3,
nios_fast_data_master_byteenable_cfi_flash_s1_segment_2,
nios_fast_data_master_byteenable_cfi_flash_s1_segment_1,
nios_fast_data_master_byteenable_cfi_flash_s1_segment_0} = nios_fast_data_master_byteenable;
  assign nios_fast_data_master_byteenable_cfi_flash_s1 = ((nios_fast_data_master_dbs_address[1 : 0] == 0))? nios_fast_data_master_byteenable_cfi_flash_s1_segment_0 :
    ((nios_fast_data_master_dbs_address[1 : 0] == 1))? nios_fast_data_master_byteenable_cfi_flash_s1_segment_1 :
    ((nios_fast_data_master_dbs_address[1 : 0] == 2))? nios_fast_data_master_byteenable_cfi_flash_s1_segment_2 :
    nios_fast_data_master_byteenable_cfi_flash_s1_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_cfi_flash_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_0_is_x = ^(incoming_data_to_and_from_the_cfi_flash[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_cfi_flash_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[0];

  //incoming_data_to_and_from_the_cfi_flash_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_1_is_x = ^(incoming_data_to_and_from_the_cfi_flash[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_cfi_flash_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[1];

  //incoming_data_to_and_from_the_cfi_flash_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_2_is_x = ^(incoming_data_to_and_from_the_cfi_flash[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_cfi_flash_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[2];

  //incoming_data_to_and_from_the_cfi_flash_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_3_is_x = ^(incoming_data_to_and_from_the_cfi_flash[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_cfi_flash_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[3];

  //incoming_data_to_and_from_the_cfi_flash_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_4_is_x = ^(incoming_data_to_and_from_the_cfi_flash[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_cfi_flash_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[4];

  //incoming_data_to_and_from_the_cfi_flash_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_5_is_x = ^(incoming_data_to_and_from_the_cfi_flash[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_cfi_flash_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[5];

  //incoming_data_to_and_from_the_cfi_flash_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_6_is_x = ^(incoming_data_to_and_from_the_cfi_flash[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_cfi_flash_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[6];

  //incoming_data_to_and_from_the_cfi_flash_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_7_is_x = ^(incoming_data_to_and_from_the_cfi_flash[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_cfi_flash_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[7];

  //cfi_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else if (1)
          enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_granted_cfi_flash_s1 + nios_fast_instruction_master_granted_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (nios_fast_data_master_saved_grant_cfi_flash_s1 + nios_fast_instruction_master_saved_grant_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 = incoming_data_to_and_from_the_cfi_flash;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tristate_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_reset_sys_clk_domain_synch_module (
                                                // inputs:
                                                 clk,
                                                 data_in,
                                                 reset_n,

                                                // outputs:
                                                 data_out
                                              )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "MAX_DELAY=\"100ns\" ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else if (1)
          data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else if (1)
          data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios (
              // 1) global signals:
               reset_n,
               sys_clk,

              // the_BUTTON_PIO
               in_port_to_the_BUTTON_PIO,

              // the_Double_ADS805_0
               ad_clk_to_the_Double_ADS805_0,
               i_input_to_the_Double_ADS805_0,
               u_input_to_the_Double_ADS805_0,

              // the_freq_avalon_0
               ad_clk_from_the_freq_avalon_0,
               freq_in_to_the_freq_avalon_0,

              // the_lcd_AO
               out_port_from_the_lcd_AO,

              // the_lcd_cs_n
               out_port_from_the_lcd_cs_n,

              // the_lcd_rst_n
               out_port_from_the_lcd_rst_n,

              // the_lcd_sck
               out_port_from_the_lcd_sck,

              // the_lcd_si
               out_port_from_the_lcd_si,

              // the_sram_16bit_0
               SRAM_ADDR_from_the_sram_16bit_0,
               SRAM_CE_N_from_the_sram_16bit_0,
               SRAM_DQ_to_and_from_the_sram_16bit_0,
               SRAM_LB_N_from_the_sram_16bit_0,
               SRAM_OE_N_from_the_sram_16bit_0,
               SRAM_UB_N_from_the_sram_16bit_0,
               SRAM_WE_N_from_the_sram_16bit_0,

              // the_tristate_bridge_avalon_slave
               address_to_the_cfi_flash,
               data_to_and_from_the_cfi_flash,
               read_n_to_the_cfi_flash,
               select_n_to_the_cfi_flash,
               write_n_to_the_cfi_flash
            )
;

  output  [ 17: 0] SRAM_ADDR_from_the_sram_16bit_0;
  output           SRAM_CE_N_from_the_sram_16bit_0;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram_16bit_0;
  output           SRAM_LB_N_from_the_sram_16bit_0;
  output           SRAM_OE_N_from_the_sram_16bit_0;
  output           SRAM_UB_N_from_the_sram_16bit_0;
  output           SRAM_WE_N_from_the_sram_16bit_0;
  output           ad_clk_from_the_freq_avalon_0;
  output  [ 21: 0] address_to_the_cfi_flash;
  inout   [  7: 0] data_to_and_from_the_cfi_flash;
  output           out_port_from_the_lcd_AO;
  output           out_port_from_the_lcd_cs_n;
  output           out_port_from_the_lcd_rst_n;
  output           out_port_from_the_lcd_sck;
  output           out_port_from_the_lcd_si;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           write_n_to_the_cfi_flash;
  input            ad_clk_to_the_Double_ADS805_0;
  input            freq_in_to_the_freq_avalon_0;
  input   [ 11: 0] i_input_to_the_Double_ADS805_0;
  input   [  4: 0] in_port_to_the_BUTTON_PIO;
  input            reset_n;
  input            sys_clk;
  input   [ 11: 0] u_input_to_the_Double_ADS805_0;

  wire    [  1: 0] BUTTON_PIO_s1_address;
  wire    [  4: 0] BUTTON_PIO_s1_readdata;
  wire    [  4: 0] BUTTON_PIO_s1_readdata_from_sa;
  wire             BUTTON_PIO_s1_reset_n;
  wire    [  1: 0] Double_ADS805_0_avalon_slave_0_address;
  wire             Double_ADS805_0_avalon_slave_0_irq;
  wire             Double_ADS805_0_avalon_slave_0_irq_from_sa;
  wire             Double_ADS805_0_avalon_slave_0_read;
  wire    [ 31: 0] Double_ADS805_0_avalon_slave_0_readdata;
  wire    [ 31: 0] Double_ADS805_0_avalon_slave_0_readdata_from_sa;
  wire             Double_ADS805_0_avalon_slave_0_reset_n;
  wire             Double_ADS805_0_avalon_slave_0_write;
  wire    [ 31: 0] Double_ADS805_0_avalon_slave_0_writedata;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram_16bit_0;
  wire             SRAM_CE_N_from_the_sram_16bit_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_16bit_0;
  wire             SRAM_LB_N_from_the_sram_16bit_0;
  wire             SRAM_OE_N_from_the_sram_16bit_0;
  wire             SRAM_UB_N_from_the_sram_16bit_0;
  wire             SRAM_WE_N_from_the_sram_16bit_0;
  wire             ad_clk_from_the_freq_avalon_0;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             d1_BUTTON_PIO_s1_end_xfer;
  wire             d1_Double_ADS805_0_avalon_slave_0_end_xfer;
  wire             d1_epcs_controller_epcs_control_port_end_xfer;
  wire             d1_freq_avalon_0_avalon_slave_0_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_AO_s1_end_xfer;
  wire             d1_lcd_cs_n_s1_end_xfer;
  wire             d1_lcd_rst_n_s1_end_xfer;
  wire             d1_lcd_sck_s1_end_xfer;
  wire             d1_lcd_si_s1_end_xfer;
  wire             d1_nios_fast_jtag_debug_module_end_xfer;
  wire             d1_sram_16bit_0_avalon_slave_0_end_xfer;
  wire             d1_sys_timer_s1_end_xfer;
  wire             d1_tristate_bridge_avalon_slave_end_xfer;
  wire    [  7: 0] data_to_and_from_the_cfi_flash;
  wire    [  8: 0] epcs_controller_epcs_control_port_address;
  wire             epcs_controller_epcs_control_port_chipselect;
  wire             epcs_controller_epcs_control_port_dataavailable;
  wire             epcs_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_controller_epcs_control_port_endofpacket;
  wire             epcs_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_controller_epcs_control_port_irq;
  wire             epcs_controller_epcs_control_port_irq_from_sa;
  wire             epcs_controller_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_readdata;
  wire    [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  wire             epcs_controller_epcs_control_port_readyfordata;
  wire             epcs_controller_epcs_control_port_readyfordata_from_sa;
  wire             epcs_controller_epcs_control_port_reset_n;
  wire             epcs_controller_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_writedata;
  wire    [  1: 0] freq_avalon_0_avalon_slave_0_address;
  wire             freq_avalon_0_avalon_slave_0_read;
  wire    [ 31: 0] freq_avalon_0_avalon_slave_0_readdata;
  wire    [ 31: 0] freq_avalon_0_avalon_slave_0_readdata_from_sa;
  wire             freq_avalon_0_avalon_slave_0_reset_n;
  wire             freq_avalon_0_avalon_slave_0_write;
  wire    [ 31: 0] freq_avalon_0_avalon_slave_0_writedata;
  wire    [  7: 0] incoming_data_to_and_from_the_cfi_flash;
  wire    [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] lcd_AO_s1_address;
  wire             lcd_AO_s1_chipselect;
  wire             lcd_AO_s1_reset_n;
  wire             lcd_AO_s1_write_n;
  wire             lcd_AO_s1_writedata;
  wire    [  1: 0] lcd_cs_n_s1_address;
  wire             lcd_cs_n_s1_chipselect;
  wire             lcd_cs_n_s1_reset_n;
  wire             lcd_cs_n_s1_write_n;
  wire             lcd_cs_n_s1_writedata;
  wire    [  1: 0] lcd_rst_n_s1_address;
  wire             lcd_rst_n_s1_chipselect;
  wire             lcd_rst_n_s1_reset_n;
  wire             lcd_rst_n_s1_write_n;
  wire             lcd_rst_n_s1_writedata;
  wire    [  1: 0] lcd_sck_s1_address;
  wire             lcd_sck_s1_chipselect;
  wire             lcd_sck_s1_reset_n;
  wire             lcd_sck_s1_write_n;
  wire             lcd_sck_s1_writedata;
  wire    [  1: 0] lcd_si_s1_address;
  wire             lcd_si_s1_chipselect;
  wire             lcd_si_s1_reset_n;
  wire             lcd_si_s1_write_n;
  wire             lcd_si_s1_writedata;
  wire    [ 23: 0] nios_fast_data_master_address;
  wire    [ 23: 0] nios_fast_data_master_address_to_slave;
  wire    [  3: 0] nios_fast_data_master_byteenable;
  wire             nios_fast_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0;
  wire    [  1: 0] nios_fast_data_master_dbs_address;
  wire    [ 15: 0] nios_fast_data_master_dbs_write_16;
  wire    [  7: 0] nios_fast_data_master_dbs_write_8;
  wire             nios_fast_data_master_debugaccess;
  wire             nios_fast_data_master_granted_BUTTON_PIO_s1;
  wire             nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_granted_cfi_flash_s1;
  wire             nios_fast_data_master_granted_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_granted_lcd_AO_s1;
  wire             nios_fast_data_master_granted_lcd_cs_n_s1;
  wire             nios_fast_data_master_granted_lcd_rst_n_s1;
  wire             nios_fast_data_master_granted_lcd_sck_s1;
  wire             nios_fast_data_master_granted_lcd_si_s1;
  wire             nios_fast_data_master_granted_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_granted_sys_timer_s1;
  wire    [ 31: 0] nios_fast_data_master_irq;
  wire             nios_fast_data_master_latency_counter;
  wire             nios_fast_data_master_qualified_request_BUTTON_PIO_s1;
  wire             nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_qualified_request_cfi_flash_s1;
  wire             nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_qualified_request_lcd_AO_s1;
  wire             nios_fast_data_master_qualified_request_lcd_cs_n_s1;
  wire             nios_fast_data_master_qualified_request_lcd_rst_n_s1;
  wire             nios_fast_data_master_qualified_request_lcd_sck_s1;
  wire             nios_fast_data_master_qualified_request_lcd_si_s1;
  wire             nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_qualified_request_sys_timer_s1;
  wire             nios_fast_data_master_read;
  wire             nios_fast_data_master_read_data_valid_BUTTON_PIO_s1;
  wire             nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_read_data_valid_cfi_flash_s1;
  wire             nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_read_data_valid_lcd_AO_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_cs_n_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_rst_n_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_sck_s1;
  wire             nios_fast_data_master_read_data_valid_lcd_si_s1;
  wire             nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_read_data_valid_sys_timer_s1;
  wire    [ 31: 0] nios_fast_data_master_readdata;
  wire             nios_fast_data_master_readdatavalid;
  wire             nios_fast_data_master_requests_BUTTON_PIO_s1;
  wire             nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_data_master_requests_cfi_flash_s1;
  wire             nios_fast_data_master_requests_epcs_controller_epcs_control_port;
  wire             nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0;
  wire             nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             nios_fast_data_master_requests_lcd_AO_s1;
  wire             nios_fast_data_master_requests_lcd_cs_n_s1;
  wire             nios_fast_data_master_requests_lcd_rst_n_s1;
  wire             nios_fast_data_master_requests_lcd_sck_s1;
  wire             nios_fast_data_master_requests_lcd_si_s1;
  wire             nios_fast_data_master_requests_nios_fast_jtag_debug_module;
  wire             nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_data_master_requests_sys_timer_s1;
  wire             nios_fast_data_master_waitrequest;
  wire             nios_fast_data_master_write;
  wire    [ 31: 0] nios_fast_data_master_writedata;
  wire    [ 23: 0] nios_fast_instruction_master_address;
  wire    [ 23: 0] nios_fast_instruction_master_address_to_slave;
  wire    [  1: 0] nios_fast_instruction_master_dbs_address;
  wire             nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_granted_cfi_flash_s1;
  wire             nios_fast_instruction_master_granted_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_granted_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_latency_counter;
  wire             nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_qualified_request_cfi_flash_s1;
  wire             nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_read;
  wire             nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_read_data_valid_cfi_flash_s1;
  wire             nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0;
  wire    [ 31: 0] nios_fast_instruction_master_readdata;
  wire             nios_fast_instruction_master_readdatavalid;
  wire             nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0;
  wire             nios_fast_instruction_master_requests_cfi_flash_s1;
  wire             nios_fast_instruction_master_requests_epcs_controller_epcs_control_port;
  wire             nios_fast_instruction_master_requests_nios_fast_jtag_debug_module;
  wire             nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0;
  wire             nios_fast_instruction_master_waitrequest;
  wire    [  8: 0] nios_fast_jtag_debug_module_address;
  wire             nios_fast_jtag_debug_module_begintransfer;
  wire    [  3: 0] nios_fast_jtag_debug_module_byteenable;
  wire             nios_fast_jtag_debug_module_chipselect;
  wire             nios_fast_jtag_debug_module_debugaccess;
  wire    [ 31: 0] nios_fast_jtag_debug_module_readdata;
  wire    [ 31: 0] nios_fast_jtag_debug_module_readdata_from_sa;
  wire             nios_fast_jtag_debug_module_reset;
  wire             nios_fast_jtag_debug_module_reset_n;
  wire             nios_fast_jtag_debug_module_resetrequest;
  wire             nios_fast_jtag_debug_module_resetrequest_from_sa;
  wire             nios_fast_jtag_debug_module_write;
  wire    [ 31: 0] nios_fast_jtag_debug_module_writedata;
  wire             out_port_from_the_lcd_AO;
  wire             out_port_from_the_lcd_cs_n;
  wire             out_port_from_the_lcd_rst_n;
  wire             out_port_from_the_lcd_sck;
  wire             out_port_from_the_lcd_si;
  wire             read_n_to_the_cfi_flash;
  wire             reset_n_sources;
  wire             select_n_to_the_cfi_flash;
  wire    [ 17: 0] sram_16bit_0_avalon_slave_0_address;
  wire    [  1: 0] sram_16bit_0_avalon_slave_0_byteenable_n;
  wire             sram_16bit_0_avalon_slave_0_chipselect_n;
  wire             sram_16bit_0_avalon_slave_0_read_n;
  wire    [ 15: 0] sram_16bit_0_avalon_slave_0_readdata;
  wire    [ 15: 0] sram_16bit_0_avalon_slave_0_readdata_from_sa;
  wire             sram_16bit_0_avalon_slave_0_wait_counter_eq_0;
  wire             sram_16bit_0_avalon_slave_0_write_n;
  wire    [ 15: 0] sram_16bit_0_avalon_slave_0_writedata;
  wire             sys_clk_reset_n;
  wire    [  2: 0] sys_timer_s1_address;
  wire             sys_timer_s1_chipselect;
  wire             sys_timer_s1_irq;
  wire             sys_timer_s1_irq_from_sa;
  wire    [ 15: 0] sys_timer_s1_readdata;
  wire    [ 15: 0] sys_timer_s1_readdata_from_sa;
  wire             sys_timer_s1_reset_n;
  wire             sys_timer_s1_write_n;
  wire    [ 15: 0] sys_timer_s1_writedata;
  wire             write_n_to_the_cfi_flash;
  BUTTON_PIO_s1_arbitrator the_BUTTON_PIO_s1
    (
      .BUTTON_PIO_s1_address                                 (BUTTON_PIO_s1_address),
      .BUTTON_PIO_s1_readdata                                (BUTTON_PIO_s1_readdata),
      .BUTTON_PIO_s1_readdata_from_sa                        (BUTTON_PIO_s1_readdata_from_sa),
      .BUTTON_PIO_s1_reset_n                                 (BUTTON_PIO_s1_reset_n),
      .clk                                                   (sys_clk),
      .d1_BUTTON_PIO_s1_end_xfer                             (d1_BUTTON_PIO_s1_end_xfer),
      .nios_fast_data_master_address_to_slave                (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_BUTTON_PIO_s1           (nios_fast_data_master_granted_BUTTON_PIO_s1),
      .nios_fast_data_master_latency_counter                 (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_BUTTON_PIO_s1 (nios_fast_data_master_qualified_request_BUTTON_PIO_s1),
      .nios_fast_data_master_read                            (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_BUTTON_PIO_s1   (nios_fast_data_master_read_data_valid_BUTTON_PIO_s1),
      .nios_fast_data_master_requests_BUTTON_PIO_s1          (nios_fast_data_master_requests_BUTTON_PIO_s1),
      .nios_fast_data_master_write                           (nios_fast_data_master_write),
      .reset_n                                               (sys_clk_reset_n)
    );

  BUTTON_PIO the_BUTTON_PIO
    (
      .address  (BUTTON_PIO_s1_address),
      .clk      (sys_clk),
      .in_port  (in_port_to_the_BUTTON_PIO),
      .readdata (BUTTON_PIO_s1_readdata),
      .reset_n  (BUTTON_PIO_s1_reset_n)
    );

  Double_ADS805_0_avalon_slave_0_arbitrator the_Double_ADS805_0_avalon_slave_0
    (
      .Double_ADS805_0_avalon_slave_0_address                                        (Double_ADS805_0_avalon_slave_0_address),
      .Double_ADS805_0_avalon_slave_0_irq                                            (Double_ADS805_0_avalon_slave_0_irq),
      .Double_ADS805_0_avalon_slave_0_irq_from_sa                                    (Double_ADS805_0_avalon_slave_0_irq_from_sa),
      .Double_ADS805_0_avalon_slave_0_read                                           (Double_ADS805_0_avalon_slave_0_read),
      .Double_ADS805_0_avalon_slave_0_readdata                                       (Double_ADS805_0_avalon_slave_0_readdata),
      .Double_ADS805_0_avalon_slave_0_readdata_from_sa                               (Double_ADS805_0_avalon_slave_0_readdata_from_sa),
      .Double_ADS805_0_avalon_slave_0_reset_n                                        (Double_ADS805_0_avalon_slave_0_reset_n),
      .Double_ADS805_0_avalon_slave_0_write                                          (Double_ADS805_0_avalon_slave_0_write),
      .Double_ADS805_0_avalon_slave_0_writedata                                      (Double_ADS805_0_avalon_slave_0_writedata),
      .clk                                                                           (sys_clk),
      .d1_Double_ADS805_0_avalon_slave_0_end_xfer                                    (d1_Double_ADS805_0_avalon_slave_0_end_xfer),
      .nios_fast_data_master_address_to_slave                                        (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0                  (nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_latency_counter                                         (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0        (nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_read                                                    (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0          (nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0                 (nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_write                                                   (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                                               (nios_fast_data_master_writedata),
      .nios_fast_instruction_master_address_to_slave                                 (nios_fast_instruction_master_address_to_slave),
      .nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0           (nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0),
      .nios_fast_instruction_master_latency_counter                                  (nios_fast_instruction_master_latency_counter),
      .nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0 (nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0),
      .nios_fast_instruction_master_read                                             (nios_fast_instruction_master_read),
      .nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0   (nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0),
      .nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0          (nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0),
      .reset_n                                                                       (sys_clk_reset_n)
    );

  Double_ADS805_0 the_Double_ADS805_0
    (
      .ad_clk    (ad_clk_to_the_Double_ADS805_0),
      .address   (Double_ADS805_0_avalon_slave_0_address),
      .clk       (sys_clk),
      .i_input   (i_input_to_the_Double_ADS805_0),
      .irq       (Double_ADS805_0_avalon_slave_0_irq),
      .read      (Double_ADS805_0_avalon_slave_0_read),
      .readdata  (Double_ADS805_0_avalon_slave_0_readdata),
      .rst_n     (Double_ADS805_0_avalon_slave_0_reset_n),
      .u_input   (u_input_to_the_Double_ADS805_0),
      .write     (Double_ADS805_0_avalon_slave_0_write),
      .writedata (Double_ADS805_0_avalon_slave_0_writedata)
    );

  epcs_controller_epcs_control_port_arbitrator the_epcs_controller_epcs_control_port
    (
      .clk                                                                              (sys_clk),
      .d1_epcs_controller_epcs_control_port_end_xfer                                    (d1_epcs_controller_epcs_control_port_end_xfer),
      .epcs_controller_epcs_control_port_address                                        (epcs_controller_epcs_control_port_address),
      .epcs_controller_epcs_control_port_chipselect                                     (epcs_controller_epcs_control_port_chipselect),
      .epcs_controller_epcs_control_port_dataavailable                                  (epcs_controller_epcs_control_port_dataavailable),
      .epcs_controller_epcs_control_port_dataavailable_from_sa                          (epcs_controller_epcs_control_port_dataavailable_from_sa),
      .epcs_controller_epcs_control_port_endofpacket                                    (epcs_controller_epcs_control_port_endofpacket),
      .epcs_controller_epcs_control_port_endofpacket_from_sa                            (epcs_controller_epcs_control_port_endofpacket_from_sa),
      .epcs_controller_epcs_control_port_irq                                            (epcs_controller_epcs_control_port_irq),
      .epcs_controller_epcs_control_port_irq_from_sa                                    (epcs_controller_epcs_control_port_irq_from_sa),
      .epcs_controller_epcs_control_port_read_n                                         (epcs_controller_epcs_control_port_read_n),
      .epcs_controller_epcs_control_port_readdata                                       (epcs_controller_epcs_control_port_readdata),
      .epcs_controller_epcs_control_port_readdata_from_sa                               (epcs_controller_epcs_control_port_readdata_from_sa),
      .epcs_controller_epcs_control_port_readyfordata                                   (epcs_controller_epcs_control_port_readyfordata),
      .epcs_controller_epcs_control_port_readyfordata_from_sa                           (epcs_controller_epcs_control_port_readyfordata_from_sa),
      .epcs_controller_epcs_control_port_reset_n                                        (epcs_controller_epcs_control_port_reset_n),
      .epcs_controller_epcs_control_port_write_n                                        (epcs_controller_epcs_control_port_write_n),
      .epcs_controller_epcs_control_port_writedata                                      (epcs_controller_epcs_control_port_writedata),
      .nios_fast_data_master_address_to_slave                                           (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_epcs_controller_epcs_control_port                  (nios_fast_data_master_granted_epcs_controller_epcs_control_port),
      .nios_fast_data_master_latency_counter                                            (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port        (nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port),
      .nios_fast_data_master_read                                                       (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port          (nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port),
      .nios_fast_data_master_requests_epcs_controller_epcs_control_port                 (nios_fast_data_master_requests_epcs_controller_epcs_control_port),
      .nios_fast_data_master_write                                                      (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                                                  (nios_fast_data_master_writedata),
      .nios_fast_instruction_master_address_to_slave                                    (nios_fast_instruction_master_address_to_slave),
      .nios_fast_instruction_master_granted_epcs_controller_epcs_control_port           (nios_fast_instruction_master_granted_epcs_controller_epcs_control_port),
      .nios_fast_instruction_master_latency_counter                                     (nios_fast_instruction_master_latency_counter),
      .nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port (nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port),
      .nios_fast_instruction_master_read                                                (nios_fast_instruction_master_read),
      .nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port   (nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port),
      .nios_fast_instruction_master_requests_epcs_controller_epcs_control_port          (nios_fast_instruction_master_requests_epcs_controller_epcs_control_port),
      .reset_n                                                                          (sys_clk_reset_n)
    );

  epcs_controller the_epcs_controller
    (
      .address       (epcs_controller_epcs_control_port_address),
      .chipselect    (epcs_controller_epcs_control_port_chipselect),
      .clk           (sys_clk),
      .dataavailable (epcs_controller_epcs_control_port_dataavailable),
      .endofpacket   (epcs_controller_epcs_control_port_endofpacket),
      .irq           (epcs_controller_epcs_control_port_irq),
      .read_n        (epcs_controller_epcs_control_port_read_n),
      .readdata      (epcs_controller_epcs_control_port_readdata),
      .readyfordata  (epcs_controller_epcs_control_port_readyfordata),
      .reset_n       (epcs_controller_epcs_control_port_reset_n),
      .write_n       (epcs_controller_epcs_control_port_write_n),
      .writedata     (epcs_controller_epcs_control_port_writedata)
    );

  freq_avalon_0_avalon_slave_0_arbitrator the_freq_avalon_0_avalon_slave_0
    (
      .clk                                                                  (sys_clk),
      .d1_freq_avalon_0_avalon_slave_0_end_xfer                             (d1_freq_avalon_0_avalon_slave_0_end_xfer),
      .freq_avalon_0_avalon_slave_0_address                                 (freq_avalon_0_avalon_slave_0_address),
      .freq_avalon_0_avalon_slave_0_read                                    (freq_avalon_0_avalon_slave_0_read),
      .freq_avalon_0_avalon_slave_0_readdata                                (freq_avalon_0_avalon_slave_0_readdata),
      .freq_avalon_0_avalon_slave_0_readdata_from_sa                        (freq_avalon_0_avalon_slave_0_readdata_from_sa),
      .freq_avalon_0_avalon_slave_0_reset_n                                 (freq_avalon_0_avalon_slave_0_reset_n),
      .freq_avalon_0_avalon_slave_0_write                                   (freq_avalon_0_avalon_slave_0_write),
      .freq_avalon_0_avalon_slave_0_writedata                               (freq_avalon_0_avalon_slave_0_writedata),
      .nios_fast_data_master_address_to_slave                               (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0           (nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_latency_counter                                (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0 (nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_read                                           (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0   (nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0          (nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_write                                          (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                                      (nios_fast_data_master_writedata),
      .reset_n                                                              (sys_clk_reset_n)
    );

  freq_avalon_0 the_freq_avalon_0
    (
      .ad_clk    (ad_clk_from_the_freq_avalon_0),
      .address   (freq_avalon_0_avalon_slave_0_address),
      .clk       (sys_clk),
      .freq_in   (freq_in_to_the_freq_avalon_0),
      .read      (freq_avalon_0_avalon_slave_0_read),
      .readdata  (freq_avalon_0_avalon_slave_0_readdata),
      .rst_n     (freq_avalon_0_avalon_slave_0_reset_n),
      .write     (freq_avalon_0_avalon_slave_0_write),
      .writedata (freq_avalon_0_avalon_slave_0_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                                 (sys_clk),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                             (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                                 (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                              (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                           (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa                   (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                                     (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                             (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                                  (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                                (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                        (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                            (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa                    (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                                 (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                             (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                     (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                                 (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                               (jtag_uart_avalon_jtag_slave_writedata),
      .nios_fast_data_master_address_to_slave                              (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave           (nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_latency_counter                               (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave (nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_read                                          (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave          (nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_write                                         (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                                     (nios_fast_data_master_writedata),
      .reset_n                                                             (sys_clk_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (sys_clk),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  lcd_AO_s1_arbitrator the_lcd_AO_s1
    (
      .clk                                               (sys_clk),
      .d1_lcd_AO_s1_end_xfer                             (d1_lcd_AO_s1_end_xfer),
      .lcd_AO_s1_address                                 (lcd_AO_s1_address),
      .lcd_AO_s1_chipselect                              (lcd_AO_s1_chipselect),
      .lcd_AO_s1_reset_n                                 (lcd_AO_s1_reset_n),
      .lcd_AO_s1_write_n                                 (lcd_AO_s1_write_n),
      .lcd_AO_s1_writedata                               (lcd_AO_s1_writedata),
      .nios_fast_data_master_address_to_slave            (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_lcd_AO_s1           (nios_fast_data_master_granted_lcd_AO_s1),
      .nios_fast_data_master_latency_counter             (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_lcd_AO_s1 (nios_fast_data_master_qualified_request_lcd_AO_s1),
      .nios_fast_data_master_read                        (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_lcd_AO_s1   (nios_fast_data_master_read_data_valid_lcd_AO_s1),
      .nios_fast_data_master_requests_lcd_AO_s1          (nios_fast_data_master_requests_lcd_AO_s1),
      .nios_fast_data_master_write                       (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                   (nios_fast_data_master_writedata),
      .reset_n                                           (sys_clk_reset_n)
    );

  lcd_AO the_lcd_AO
    (
      .address    (lcd_AO_s1_address),
      .chipselect (lcd_AO_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_lcd_AO),
      .reset_n    (lcd_AO_s1_reset_n),
      .write_n    (lcd_AO_s1_write_n),
      .writedata  (lcd_AO_s1_writedata)
    );

  lcd_cs_n_s1_arbitrator the_lcd_cs_n_s1
    (
      .clk                                                 (sys_clk),
      .d1_lcd_cs_n_s1_end_xfer                             (d1_lcd_cs_n_s1_end_xfer),
      .lcd_cs_n_s1_address                                 (lcd_cs_n_s1_address),
      .lcd_cs_n_s1_chipselect                              (lcd_cs_n_s1_chipselect),
      .lcd_cs_n_s1_reset_n                                 (lcd_cs_n_s1_reset_n),
      .lcd_cs_n_s1_write_n                                 (lcd_cs_n_s1_write_n),
      .lcd_cs_n_s1_writedata                               (lcd_cs_n_s1_writedata),
      .nios_fast_data_master_address_to_slave              (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_lcd_cs_n_s1           (nios_fast_data_master_granted_lcd_cs_n_s1),
      .nios_fast_data_master_latency_counter               (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_lcd_cs_n_s1 (nios_fast_data_master_qualified_request_lcd_cs_n_s1),
      .nios_fast_data_master_read                          (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_lcd_cs_n_s1   (nios_fast_data_master_read_data_valid_lcd_cs_n_s1),
      .nios_fast_data_master_requests_lcd_cs_n_s1          (nios_fast_data_master_requests_lcd_cs_n_s1),
      .nios_fast_data_master_write                         (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                     (nios_fast_data_master_writedata),
      .reset_n                                             (sys_clk_reset_n)
    );

  lcd_cs_n the_lcd_cs_n
    (
      .address    (lcd_cs_n_s1_address),
      .chipselect (lcd_cs_n_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_lcd_cs_n),
      .reset_n    (lcd_cs_n_s1_reset_n),
      .write_n    (lcd_cs_n_s1_write_n),
      .writedata  (lcd_cs_n_s1_writedata)
    );

  lcd_rst_n_s1_arbitrator the_lcd_rst_n_s1
    (
      .clk                                                  (sys_clk),
      .d1_lcd_rst_n_s1_end_xfer                             (d1_lcd_rst_n_s1_end_xfer),
      .lcd_rst_n_s1_address                                 (lcd_rst_n_s1_address),
      .lcd_rst_n_s1_chipselect                              (lcd_rst_n_s1_chipselect),
      .lcd_rst_n_s1_reset_n                                 (lcd_rst_n_s1_reset_n),
      .lcd_rst_n_s1_write_n                                 (lcd_rst_n_s1_write_n),
      .lcd_rst_n_s1_writedata                               (lcd_rst_n_s1_writedata),
      .nios_fast_data_master_address_to_slave               (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_lcd_rst_n_s1           (nios_fast_data_master_granted_lcd_rst_n_s1),
      .nios_fast_data_master_latency_counter                (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_lcd_rst_n_s1 (nios_fast_data_master_qualified_request_lcd_rst_n_s1),
      .nios_fast_data_master_read                           (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_lcd_rst_n_s1   (nios_fast_data_master_read_data_valid_lcd_rst_n_s1),
      .nios_fast_data_master_requests_lcd_rst_n_s1          (nios_fast_data_master_requests_lcd_rst_n_s1),
      .nios_fast_data_master_write                          (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                      (nios_fast_data_master_writedata),
      .reset_n                                              (sys_clk_reset_n)
    );

  lcd_rst_n the_lcd_rst_n
    (
      .address    (lcd_rst_n_s1_address),
      .chipselect (lcd_rst_n_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_lcd_rst_n),
      .reset_n    (lcd_rst_n_s1_reset_n),
      .write_n    (lcd_rst_n_s1_write_n),
      .writedata  (lcd_rst_n_s1_writedata)
    );

  lcd_sck_s1_arbitrator the_lcd_sck_s1
    (
      .clk                                                (sys_clk),
      .d1_lcd_sck_s1_end_xfer                             (d1_lcd_sck_s1_end_xfer),
      .lcd_sck_s1_address                                 (lcd_sck_s1_address),
      .lcd_sck_s1_chipselect                              (lcd_sck_s1_chipselect),
      .lcd_sck_s1_reset_n                                 (lcd_sck_s1_reset_n),
      .lcd_sck_s1_write_n                                 (lcd_sck_s1_write_n),
      .lcd_sck_s1_writedata                               (lcd_sck_s1_writedata),
      .nios_fast_data_master_address_to_slave             (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_lcd_sck_s1           (nios_fast_data_master_granted_lcd_sck_s1),
      .nios_fast_data_master_latency_counter              (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_lcd_sck_s1 (nios_fast_data_master_qualified_request_lcd_sck_s1),
      .nios_fast_data_master_read                         (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_lcd_sck_s1   (nios_fast_data_master_read_data_valid_lcd_sck_s1),
      .nios_fast_data_master_requests_lcd_sck_s1          (nios_fast_data_master_requests_lcd_sck_s1),
      .nios_fast_data_master_write                        (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                    (nios_fast_data_master_writedata),
      .reset_n                                            (sys_clk_reset_n)
    );

  lcd_sck the_lcd_sck
    (
      .address    (lcd_sck_s1_address),
      .chipselect (lcd_sck_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_lcd_sck),
      .reset_n    (lcd_sck_s1_reset_n),
      .write_n    (lcd_sck_s1_write_n),
      .writedata  (lcd_sck_s1_writedata)
    );

  lcd_si_s1_arbitrator the_lcd_si_s1
    (
      .clk                                               (sys_clk),
      .d1_lcd_si_s1_end_xfer                             (d1_lcd_si_s1_end_xfer),
      .lcd_si_s1_address                                 (lcd_si_s1_address),
      .lcd_si_s1_chipselect                              (lcd_si_s1_chipselect),
      .lcd_si_s1_reset_n                                 (lcd_si_s1_reset_n),
      .lcd_si_s1_write_n                                 (lcd_si_s1_write_n),
      .lcd_si_s1_writedata                               (lcd_si_s1_writedata),
      .nios_fast_data_master_address_to_slave            (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_lcd_si_s1           (nios_fast_data_master_granted_lcd_si_s1),
      .nios_fast_data_master_latency_counter             (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_lcd_si_s1 (nios_fast_data_master_qualified_request_lcd_si_s1),
      .nios_fast_data_master_read                        (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_lcd_si_s1   (nios_fast_data_master_read_data_valid_lcd_si_s1),
      .nios_fast_data_master_requests_lcd_si_s1          (nios_fast_data_master_requests_lcd_si_s1),
      .nios_fast_data_master_write                       (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                   (nios_fast_data_master_writedata),
      .reset_n                                           (sys_clk_reset_n)
    );

  lcd_si the_lcd_si
    (
      .address    (lcd_si_s1_address),
      .chipselect (lcd_si_s1_chipselect),
      .clk        (sys_clk),
      .out_port   (out_port_from_the_lcd_si),
      .reset_n    (lcd_si_s1_reset_n),
      .write_n    (lcd_si_s1_write_n),
      .writedata  (lcd_si_s1_writedata)
    );

  nios_fast_jtag_debug_module_arbitrator the_nios_fast_jtag_debug_module
    (
      .clk                                                                        (sys_clk),
      .d1_nios_fast_jtag_debug_module_end_xfer                                    (d1_nios_fast_jtag_debug_module_end_xfer),
      .nios_fast_data_master_address_to_slave                                     (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_byteenable                                           (nios_fast_data_master_byteenable),
      .nios_fast_data_master_debugaccess                                          (nios_fast_data_master_debugaccess),
      .nios_fast_data_master_granted_nios_fast_jtag_debug_module                  (nios_fast_data_master_granted_nios_fast_jtag_debug_module),
      .nios_fast_data_master_latency_counter                                      (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module        (nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module),
      .nios_fast_data_master_read                                                 (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module          (nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module),
      .nios_fast_data_master_requests_nios_fast_jtag_debug_module                 (nios_fast_data_master_requests_nios_fast_jtag_debug_module),
      .nios_fast_data_master_write                                                (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                                            (nios_fast_data_master_writedata),
      .nios_fast_instruction_master_address_to_slave                              (nios_fast_instruction_master_address_to_slave),
      .nios_fast_instruction_master_granted_nios_fast_jtag_debug_module           (nios_fast_instruction_master_granted_nios_fast_jtag_debug_module),
      .nios_fast_instruction_master_latency_counter                               (nios_fast_instruction_master_latency_counter),
      .nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module (nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module),
      .nios_fast_instruction_master_read                                          (nios_fast_instruction_master_read),
      .nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module   (nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module),
      .nios_fast_instruction_master_requests_nios_fast_jtag_debug_module          (nios_fast_instruction_master_requests_nios_fast_jtag_debug_module),
      .nios_fast_jtag_debug_module_address                                        (nios_fast_jtag_debug_module_address),
      .nios_fast_jtag_debug_module_begintransfer                                  (nios_fast_jtag_debug_module_begintransfer),
      .nios_fast_jtag_debug_module_byteenable                                     (nios_fast_jtag_debug_module_byteenable),
      .nios_fast_jtag_debug_module_chipselect                                     (nios_fast_jtag_debug_module_chipselect),
      .nios_fast_jtag_debug_module_debugaccess                                    (nios_fast_jtag_debug_module_debugaccess),
      .nios_fast_jtag_debug_module_readdata                                       (nios_fast_jtag_debug_module_readdata),
      .nios_fast_jtag_debug_module_readdata_from_sa                               (nios_fast_jtag_debug_module_readdata_from_sa),
      .nios_fast_jtag_debug_module_reset                                          (nios_fast_jtag_debug_module_reset),
      .nios_fast_jtag_debug_module_reset_n                                        (nios_fast_jtag_debug_module_reset_n),
      .nios_fast_jtag_debug_module_resetrequest                                   (nios_fast_jtag_debug_module_resetrequest),
      .nios_fast_jtag_debug_module_resetrequest_from_sa                           (nios_fast_jtag_debug_module_resetrequest_from_sa),
      .nios_fast_jtag_debug_module_write                                          (nios_fast_jtag_debug_module_write),
      .nios_fast_jtag_debug_module_writedata                                      (nios_fast_jtag_debug_module_writedata),
      .reset_n                                                                    (sys_clk_reset_n)
    );

  nios_fast_data_master_arbitrator the_nios_fast_data_master
    (
      .BUTTON_PIO_s1_readdata_from_sa                                            (BUTTON_PIO_s1_readdata_from_sa),
      .Double_ADS805_0_avalon_slave_0_irq_from_sa                                (Double_ADS805_0_avalon_slave_0_irq_from_sa),
      .Double_ADS805_0_avalon_slave_0_readdata_from_sa                           (Double_ADS805_0_avalon_slave_0_readdata_from_sa),
      .cfi_flash_s1_wait_counter_eq_0                                            (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                       (sys_clk),
      .d1_BUTTON_PIO_s1_end_xfer                                                 (d1_BUTTON_PIO_s1_end_xfer),
      .d1_Double_ADS805_0_avalon_slave_0_end_xfer                                (d1_Double_ADS805_0_avalon_slave_0_end_xfer),
      .d1_epcs_controller_epcs_control_port_end_xfer                             (d1_epcs_controller_epcs_control_port_end_xfer),
      .d1_freq_avalon_0_avalon_slave_0_end_xfer                                  (d1_freq_avalon_0_avalon_slave_0_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                   (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_lcd_AO_s1_end_xfer                                                     (d1_lcd_AO_s1_end_xfer),
      .d1_lcd_cs_n_s1_end_xfer                                                   (d1_lcd_cs_n_s1_end_xfer),
      .d1_lcd_rst_n_s1_end_xfer                                                  (d1_lcd_rst_n_s1_end_xfer),
      .d1_lcd_sck_s1_end_xfer                                                    (d1_lcd_sck_s1_end_xfer),
      .d1_lcd_si_s1_end_xfer                                                     (d1_lcd_si_s1_end_xfer),
      .d1_nios_fast_jtag_debug_module_end_xfer                                   (d1_nios_fast_jtag_debug_module_end_xfer),
      .d1_sram_16bit_0_avalon_slave_0_end_xfer                                   (d1_sram_16bit_0_avalon_slave_0_end_xfer),
      .d1_sys_timer_s1_end_xfer                                                  (d1_sys_timer_s1_end_xfer),
      .d1_tristate_bridge_avalon_slave_end_xfer                                  (d1_tristate_bridge_avalon_slave_end_xfer),
      .epcs_controller_epcs_control_port_irq_from_sa                             (epcs_controller_epcs_control_port_irq_from_sa),
      .epcs_controller_epcs_control_port_readdata_from_sa                        (epcs_controller_epcs_control_port_readdata_from_sa),
      .freq_avalon_0_avalon_slave_0_readdata_from_sa                             (freq_avalon_0_avalon_slave_0_readdata_from_sa),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0            (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                   (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                              (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                           (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .nios_fast_data_master_address                                             (nios_fast_data_master_address),
      .nios_fast_data_master_address_to_slave                                    (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_byteenable_cfi_flash_s1                             (nios_fast_data_master_byteenable_cfi_flash_s1),
      .nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0              (nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_dbs_address                                         (nios_fast_data_master_dbs_address),
      .nios_fast_data_master_dbs_write_16                                        (nios_fast_data_master_dbs_write_16),
      .nios_fast_data_master_dbs_write_8                                         (nios_fast_data_master_dbs_write_8),
      .nios_fast_data_master_debugaccess                                         (nios_fast_data_master_debugaccess),
      .nios_fast_data_master_granted_BUTTON_PIO_s1                               (nios_fast_data_master_granted_BUTTON_PIO_s1),
      .nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0              (nios_fast_data_master_granted_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_granted_cfi_flash_s1                                (nios_fast_data_master_granted_cfi_flash_s1),
      .nios_fast_data_master_granted_epcs_controller_epcs_control_port           (nios_fast_data_master_granted_epcs_controller_epcs_control_port),
      .nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0                (nios_fast_data_master_granted_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave                 (nios_fast_data_master_granted_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_granted_lcd_AO_s1                                   (nios_fast_data_master_granted_lcd_AO_s1),
      .nios_fast_data_master_granted_lcd_cs_n_s1                                 (nios_fast_data_master_granted_lcd_cs_n_s1),
      .nios_fast_data_master_granted_lcd_rst_n_s1                                (nios_fast_data_master_granted_lcd_rst_n_s1),
      .nios_fast_data_master_granted_lcd_sck_s1                                  (nios_fast_data_master_granted_lcd_sck_s1),
      .nios_fast_data_master_granted_lcd_si_s1                                   (nios_fast_data_master_granted_lcd_si_s1),
      .nios_fast_data_master_granted_nios_fast_jtag_debug_module                 (nios_fast_data_master_granted_nios_fast_jtag_debug_module),
      .nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0                 (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_granted_sys_timer_s1                                (nios_fast_data_master_granted_sys_timer_s1),
      .nios_fast_data_master_irq                                                 (nios_fast_data_master_irq),
      .nios_fast_data_master_latency_counter                                     (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_BUTTON_PIO_s1                     (nios_fast_data_master_qualified_request_BUTTON_PIO_s1),
      .nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0    (nios_fast_data_master_qualified_request_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_qualified_request_cfi_flash_s1                      (nios_fast_data_master_qualified_request_cfi_flash_s1),
      .nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port (nios_fast_data_master_qualified_request_epcs_controller_epcs_control_port),
      .nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0      (nios_fast_data_master_qualified_request_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave       (nios_fast_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_qualified_request_lcd_AO_s1                         (nios_fast_data_master_qualified_request_lcd_AO_s1),
      .nios_fast_data_master_qualified_request_lcd_cs_n_s1                       (nios_fast_data_master_qualified_request_lcd_cs_n_s1),
      .nios_fast_data_master_qualified_request_lcd_rst_n_s1                      (nios_fast_data_master_qualified_request_lcd_rst_n_s1),
      .nios_fast_data_master_qualified_request_lcd_sck_s1                        (nios_fast_data_master_qualified_request_lcd_sck_s1),
      .nios_fast_data_master_qualified_request_lcd_si_s1                         (nios_fast_data_master_qualified_request_lcd_si_s1),
      .nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module       (nios_fast_data_master_qualified_request_nios_fast_jtag_debug_module),
      .nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0       (nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_qualified_request_sys_timer_s1                      (nios_fast_data_master_qualified_request_sys_timer_s1),
      .nios_fast_data_master_read                                                (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_BUTTON_PIO_s1                       (nios_fast_data_master_read_data_valid_BUTTON_PIO_s1),
      .nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0      (nios_fast_data_master_read_data_valid_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_read_data_valid_cfi_flash_s1                        (nios_fast_data_master_read_data_valid_cfi_flash_s1),
      .nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port   (nios_fast_data_master_read_data_valid_epcs_controller_epcs_control_port),
      .nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0        (nios_fast_data_master_read_data_valid_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave         (nios_fast_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_read_data_valid_lcd_AO_s1                           (nios_fast_data_master_read_data_valid_lcd_AO_s1),
      .nios_fast_data_master_read_data_valid_lcd_cs_n_s1                         (nios_fast_data_master_read_data_valid_lcd_cs_n_s1),
      .nios_fast_data_master_read_data_valid_lcd_rst_n_s1                        (nios_fast_data_master_read_data_valid_lcd_rst_n_s1),
      .nios_fast_data_master_read_data_valid_lcd_sck_s1                          (nios_fast_data_master_read_data_valid_lcd_sck_s1),
      .nios_fast_data_master_read_data_valid_lcd_si_s1                           (nios_fast_data_master_read_data_valid_lcd_si_s1),
      .nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module         (nios_fast_data_master_read_data_valid_nios_fast_jtag_debug_module),
      .nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0         (nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_read_data_valid_sys_timer_s1                        (nios_fast_data_master_read_data_valid_sys_timer_s1),
      .nios_fast_data_master_readdata                                            (nios_fast_data_master_readdata),
      .nios_fast_data_master_readdatavalid                                       (nios_fast_data_master_readdatavalid),
      .nios_fast_data_master_requests_BUTTON_PIO_s1                              (nios_fast_data_master_requests_BUTTON_PIO_s1),
      .nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0             (nios_fast_data_master_requests_Double_ADS805_0_avalon_slave_0),
      .nios_fast_data_master_requests_cfi_flash_s1                               (nios_fast_data_master_requests_cfi_flash_s1),
      .nios_fast_data_master_requests_epcs_controller_epcs_control_port          (nios_fast_data_master_requests_epcs_controller_epcs_control_port),
      .nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0               (nios_fast_data_master_requests_freq_avalon_0_avalon_slave_0),
      .nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave                (nios_fast_data_master_requests_jtag_uart_avalon_jtag_slave),
      .nios_fast_data_master_requests_lcd_AO_s1                                  (nios_fast_data_master_requests_lcd_AO_s1),
      .nios_fast_data_master_requests_lcd_cs_n_s1                                (nios_fast_data_master_requests_lcd_cs_n_s1),
      .nios_fast_data_master_requests_lcd_rst_n_s1                               (nios_fast_data_master_requests_lcd_rst_n_s1),
      .nios_fast_data_master_requests_lcd_sck_s1                                 (nios_fast_data_master_requests_lcd_sck_s1),
      .nios_fast_data_master_requests_lcd_si_s1                                  (nios_fast_data_master_requests_lcd_si_s1),
      .nios_fast_data_master_requests_nios_fast_jtag_debug_module                (nios_fast_data_master_requests_nios_fast_jtag_debug_module),
      .nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0                (nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_requests_sys_timer_s1                               (nios_fast_data_master_requests_sys_timer_s1),
      .nios_fast_data_master_waitrequest                                         (nios_fast_data_master_waitrequest),
      .nios_fast_data_master_write                                               (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                                           (nios_fast_data_master_writedata),
      .nios_fast_jtag_debug_module_readdata_from_sa                              (nios_fast_jtag_debug_module_readdata_from_sa),
      .reset_n                                                                   (sys_clk_reset_n),
      .sram_16bit_0_avalon_slave_0_readdata_from_sa                              (sram_16bit_0_avalon_slave_0_readdata_from_sa),
      .sram_16bit_0_avalon_slave_0_wait_counter_eq_0                             (sram_16bit_0_avalon_slave_0_wait_counter_eq_0),
      .sys_timer_s1_irq_from_sa                                                  (sys_timer_s1_irq_from_sa),
      .sys_timer_s1_readdata_from_sa                                             (sys_timer_s1_readdata_from_sa)
    );

  nios_fast_instruction_master_arbitrator the_nios_fast_instruction_master
    (
      .Double_ADS805_0_avalon_slave_0_readdata_from_sa                                  (Double_ADS805_0_avalon_slave_0_readdata_from_sa),
      .cfi_flash_s1_wait_counter_eq_0                                                   (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                              (sys_clk),
      .d1_Double_ADS805_0_avalon_slave_0_end_xfer                                       (d1_Double_ADS805_0_avalon_slave_0_end_xfer),
      .d1_epcs_controller_epcs_control_port_end_xfer                                    (d1_epcs_controller_epcs_control_port_end_xfer),
      .d1_nios_fast_jtag_debug_module_end_xfer                                          (d1_nios_fast_jtag_debug_module_end_xfer),
      .d1_sram_16bit_0_avalon_slave_0_end_xfer                                          (d1_sram_16bit_0_avalon_slave_0_end_xfer),
      .d1_tristate_bridge_avalon_slave_end_xfer                                         (d1_tristate_bridge_avalon_slave_end_xfer),
      .epcs_controller_epcs_control_port_readdata_from_sa                               (epcs_controller_epcs_control_port_readdata_from_sa),
      .incoming_data_to_and_from_the_cfi_flash                                          (incoming_data_to_and_from_the_cfi_flash),
      .nios_fast_instruction_master_address                                             (nios_fast_instruction_master_address),
      .nios_fast_instruction_master_address_to_slave                                    (nios_fast_instruction_master_address_to_slave),
      .nios_fast_instruction_master_dbs_address                                         (nios_fast_instruction_master_dbs_address),
      .nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0              (nios_fast_instruction_master_granted_Double_ADS805_0_avalon_slave_0),
      .nios_fast_instruction_master_granted_cfi_flash_s1                                (nios_fast_instruction_master_granted_cfi_flash_s1),
      .nios_fast_instruction_master_granted_epcs_controller_epcs_control_port           (nios_fast_instruction_master_granted_epcs_controller_epcs_control_port),
      .nios_fast_instruction_master_granted_nios_fast_jtag_debug_module                 (nios_fast_instruction_master_granted_nios_fast_jtag_debug_module),
      .nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0                 (nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0),
      .nios_fast_instruction_master_latency_counter                                     (nios_fast_instruction_master_latency_counter),
      .nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0    (nios_fast_instruction_master_qualified_request_Double_ADS805_0_avalon_slave_0),
      .nios_fast_instruction_master_qualified_request_cfi_flash_s1                      (nios_fast_instruction_master_qualified_request_cfi_flash_s1),
      .nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port (nios_fast_instruction_master_qualified_request_epcs_controller_epcs_control_port),
      .nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module       (nios_fast_instruction_master_qualified_request_nios_fast_jtag_debug_module),
      .nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0       (nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0),
      .nios_fast_instruction_master_read                                                (nios_fast_instruction_master_read),
      .nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0      (nios_fast_instruction_master_read_data_valid_Double_ADS805_0_avalon_slave_0),
      .nios_fast_instruction_master_read_data_valid_cfi_flash_s1                        (nios_fast_instruction_master_read_data_valid_cfi_flash_s1),
      .nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port   (nios_fast_instruction_master_read_data_valid_epcs_controller_epcs_control_port),
      .nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module         (nios_fast_instruction_master_read_data_valid_nios_fast_jtag_debug_module),
      .nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0         (nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0),
      .nios_fast_instruction_master_readdata                                            (nios_fast_instruction_master_readdata),
      .nios_fast_instruction_master_readdatavalid                                       (nios_fast_instruction_master_readdatavalid),
      .nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0             (nios_fast_instruction_master_requests_Double_ADS805_0_avalon_slave_0),
      .nios_fast_instruction_master_requests_cfi_flash_s1                               (nios_fast_instruction_master_requests_cfi_flash_s1),
      .nios_fast_instruction_master_requests_epcs_controller_epcs_control_port          (nios_fast_instruction_master_requests_epcs_controller_epcs_control_port),
      .nios_fast_instruction_master_requests_nios_fast_jtag_debug_module                (nios_fast_instruction_master_requests_nios_fast_jtag_debug_module),
      .nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0                (nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0),
      .nios_fast_instruction_master_waitrequest                                         (nios_fast_instruction_master_waitrequest),
      .nios_fast_jtag_debug_module_readdata_from_sa                                     (nios_fast_jtag_debug_module_readdata_from_sa),
      .reset_n                                                                          (sys_clk_reset_n),
      .sram_16bit_0_avalon_slave_0_readdata_from_sa                                     (sram_16bit_0_avalon_slave_0_readdata_from_sa),
      .sram_16bit_0_avalon_slave_0_wait_counter_eq_0                                    (sram_16bit_0_avalon_slave_0_wait_counter_eq_0)
    );

  nios_fast the_nios_fast
    (
      .clk                                   (sys_clk),
      .d_address                             (nios_fast_data_master_address),
      .d_byteenable                          (nios_fast_data_master_byteenable),
      .d_irq                                 (nios_fast_data_master_irq),
      .d_read                                (nios_fast_data_master_read),
      .d_readdata                            (nios_fast_data_master_readdata),
      .d_readdatavalid                       (nios_fast_data_master_readdatavalid),
      .d_waitrequest                         (nios_fast_data_master_waitrequest),
      .d_write                               (nios_fast_data_master_write),
      .d_writedata                           (nios_fast_data_master_writedata),
      .i_address                             (nios_fast_instruction_master_address),
      .i_read                                (nios_fast_instruction_master_read),
      .i_readdata                            (nios_fast_instruction_master_readdata),
      .i_readdatavalid                       (nios_fast_instruction_master_readdatavalid),
      .i_waitrequest                         (nios_fast_instruction_master_waitrequest),
      .jtag_debug_module_address             (nios_fast_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (nios_fast_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (nios_fast_jtag_debug_module_byteenable),
      .jtag_debug_module_clk                 (sys_clk),
      .jtag_debug_module_debugaccess         (nios_fast_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (nios_fast_data_master_debugaccess),
      .jtag_debug_module_readdata            (nios_fast_jtag_debug_module_readdata),
      .jtag_debug_module_reset               (nios_fast_jtag_debug_module_reset),
      .jtag_debug_module_resetrequest        (nios_fast_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (nios_fast_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (nios_fast_jtag_debug_module_write),
      .jtag_debug_module_writedata           (nios_fast_jtag_debug_module_writedata),
      .reset_n                               (nios_fast_jtag_debug_module_reset_n)
    );

  sram_16bit_0_avalon_slave_0_arbitrator the_sram_16bit_0_avalon_slave_0
    (
      .clk                                                                        (sys_clk),
      .d1_sram_16bit_0_avalon_slave_0_end_xfer                                    (d1_sram_16bit_0_avalon_slave_0_end_xfer),
      .nios_fast_data_master_address_to_slave                                     (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_byteenable                                           (nios_fast_data_master_byteenable),
      .nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0               (nios_fast_data_master_byteenable_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_dbs_address                                          (nios_fast_data_master_dbs_address),
      .nios_fast_data_master_dbs_write_16                                         (nios_fast_data_master_dbs_write_16),
      .nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0                  (nios_fast_data_master_granted_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_latency_counter                                      (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0        (nios_fast_data_master_qualified_request_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_read                                                 (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0          (nios_fast_data_master_read_data_valid_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0                 (nios_fast_data_master_requests_sram_16bit_0_avalon_slave_0),
      .nios_fast_data_master_write                                                (nios_fast_data_master_write),
      .nios_fast_instruction_master_address_to_slave                              (nios_fast_instruction_master_address_to_slave),
      .nios_fast_instruction_master_dbs_address                                   (nios_fast_instruction_master_dbs_address),
      .nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0           (nios_fast_instruction_master_granted_sram_16bit_0_avalon_slave_0),
      .nios_fast_instruction_master_latency_counter                               (nios_fast_instruction_master_latency_counter),
      .nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0 (nios_fast_instruction_master_qualified_request_sram_16bit_0_avalon_slave_0),
      .nios_fast_instruction_master_read                                          (nios_fast_instruction_master_read),
      .nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0   (nios_fast_instruction_master_read_data_valid_sram_16bit_0_avalon_slave_0),
      .nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0          (nios_fast_instruction_master_requests_sram_16bit_0_avalon_slave_0),
      .reset_n                                                                    (sys_clk_reset_n),
      .sram_16bit_0_avalon_slave_0_address                                        (sram_16bit_0_avalon_slave_0_address),
      .sram_16bit_0_avalon_slave_0_byteenable_n                                   (sram_16bit_0_avalon_slave_0_byteenable_n),
      .sram_16bit_0_avalon_slave_0_chipselect_n                                   (sram_16bit_0_avalon_slave_0_chipselect_n),
      .sram_16bit_0_avalon_slave_0_read_n                                         (sram_16bit_0_avalon_slave_0_read_n),
      .sram_16bit_0_avalon_slave_0_readdata                                       (sram_16bit_0_avalon_slave_0_readdata),
      .sram_16bit_0_avalon_slave_0_readdata_from_sa                               (sram_16bit_0_avalon_slave_0_readdata_from_sa),
      .sram_16bit_0_avalon_slave_0_wait_counter_eq_0                              (sram_16bit_0_avalon_slave_0_wait_counter_eq_0),
      .sram_16bit_0_avalon_slave_0_write_n                                        (sram_16bit_0_avalon_slave_0_write_n),
      .sram_16bit_0_avalon_slave_0_writedata                                      (sram_16bit_0_avalon_slave_0_writedata)
    );

  sram_16bit_0 the_sram_16bit_0
    (
      .SRAM_ADDR (SRAM_ADDR_from_the_sram_16bit_0),
      .SRAM_CE_N (SRAM_CE_N_from_the_sram_16bit_0),
      .SRAM_DQ   (SRAM_DQ_to_and_from_the_sram_16bit_0),
      .SRAM_LB_N (SRAM_LB_N_from_the_sram_16bit_0),
      .SRAM_OE_N (SRAM_OE_N_from_the_sram_16bit_0),
      .SRAM_UB_N (SRAM_UB_N_from_the_sram_16bit_0),
      .SRAM_WE_N (SRAM_WE_N_from_the_sram_16bit_0),
      .iADDR     (sram_16bit_0_avalon_slave_0_address),
      .iBE_N     (sram_16bit_0_avalon_slave_0_byteenable_n),
      .iCE_N     (sram_16bit_0_avalon_slave_0_chipselect_n),
      .iCLK      (sys_clk),
      .iDATA     (sram_16bit_0_avalon_slave_0_writedata),
      .iOE_N     (sram_16bit_0_avalon_slave_0_read_n),
      .iWE_N     (sram_16bit_0_avalon_slave_0_write_n),
      .oDATA     (sram_16bit_0_avalon_slave_0_readdata)
    );

  sys_timer_s1_arbitrator the_sys_timer_s1
    (
      .clk                                                  (sys_clk),
      .d1_sys_timer_s1_end_xfer                             (d1_sys_timer_s1_end_xfer),
      .nios_fast_data_master_address_to_slave               (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_granted_sys_timer_s1           (nios_fast_data_master_granted_sys_timer_s1),
      .nios_fast_data_master_latency_counter                (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_sys_timer_s1 (nios_fast_data_master_qualified_request_sys_timer_s1),
      .nios_fast_data_master_read                           (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_sys_timer_s1   (nios_fast_data_master_read_data_valid_sys_timer_s1),
      .nios_fast_data_master_requests_sys_timer_s1          (nios_fast_data_master_requests_sys_timer_s1),
      .nios_fast_data_master_write                          (nios_fast_data_master_write),
      .nios_fast_data_master_writedata                      (nios_fast_data_master_writedata),
      .reset_n                                              (sys_clk_reset_n),
      .sys_timer_s1_address                                 (sys_timer_s1_address),
      .sys_timer_s1_chipselect                              (sys_timer_s1_chipselect),
      .sys_timer_s1_irq                                     (sys_timer_s1_irq),
      .sys_timer_s1_irq_from_sa                             (sys_timer_s1_irq_from_sa),
      .sys_timer_s1_readdata                                (sys_timer_s1_readdata),
      .sys_timer_s1_readdata_from_sa                        (sys_timer_s1_readdata_from_sa),
      .sys_timer_s1_reset_n                                 (sys_timer_s1_reset_n),
      .sys_timer_s1_write_n                                 (sys_timer_s1_write_n),
      .sys_timer_s1_writedata                               (sys_timer_s1_writedata)
    );

  sys_timer the_sys_timer
    (
      .address    (sys_timer_s1_address),
      .chipselect (sys_timer_s1_chipselect),
      .clk        (sys_clk),
      .irq        (sys_timer_s1_irq),
      .readdata   (sys_timer_s1_readdata),
      .reset_n    (sys_timer_s1_reset_n),
      .write_n    (sys_timer_s1_write_n),
      .writedata  (sys_timer_s1_writedata)
    );

  tristate_bridge_avalon_slave_arbitrator the_tristate_bridge_avalon_slave
    (
      .address_to_the_cfi_flash                                       (address_to_the_cfi_flash),
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                            (sys_clk),
      .d1_tristate_bridge_avalon_slave_end_xfer                       (d1_tristate_bridge_avalon_slave_end_xfer),
      .data_to_and_from_the_cfi_flash                                 (data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash                        (incoming_data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .nios_fast_data_master_address_to_slave                         (nios_fast_data_master_address_to_slave),
      .nios_fast_data_master_byteenable                               (nios_fast_data_master_byteenable),
      .nios_fast_data_master_byteenable_cfi_flash_s1                  (nios_fast_data_master_byteenable_cfi_flash_s1),
      .nios_fast_data_master_dbs_address                              (nios_fast_data_master_dbs_address),
      .nios_fast_data_master_dbs_write_8                              (nios_fast_data_master_dbs_write_8),
      .nios_fast_data_master_granted_cfi_flash_s1                     (nios_fast_data_master_granted_cfi_flash_s1),
      .nios_fast_data_master_latency_counter                          (nios_fast_data_master_latency_counter),
      .nios_fast_data_master_qualified_request_cfi_flash_s1           (nios_fast_data_master_qualified_request_cfi_flash_s1),
      .nios_fast_data_master_read                                     (nios_fast_data_master_read),
      .nios_fast_data_master_read_data_valid_cfi_flash_s1             (nios_fast_data_master_read_data_valid_cfi_flash_s1),
      .nios_fast_data_master_requests_cfi_flash_s1                    (nios_fast_data_master_requests_cfi_flash_s1),
      .nios_fast_data_master_write                                    (nios_fast_data_master_write),
      .nios_fast_instruction_master_address_to_slave                  (nios_fast_instruction_master_address_to_slave),
      .nios_fast_instruction_master_dbs_address                       (nios_fast_instruction_master_dbs_address),
      .nios_fast_instruction_master_granted_cfi_flash_s1              (nios_fast_instruction_master_granted_cfi_flash_s1),
      .nios_fast_instruction_master_latency_counter                   (nios_fast_instruction_master_latency_counter),
      .nios_fast_instruction_master_qualified_request_cfi_flash_s1    (nios_fast_instruction_master_qualified_request_cfi_flash_s1),
      .nios_fast_instruction_master_read                              (nios_fast_instruction_master_read),
      .nios_fast_instruction_master_read_data_valid_cfi_flash_s1      (nios_fast_instruction_master_read_data_valid_cfi_flash_s1),
      .nios_fast_instruction_master_requests_cfi_flash_s1             (nios_fast_instruction_master_requests_cfi_flash_s1),
      .read_n_to_the_cfi_flash                                        (read_n_to_the_cfi_flash),
      .reset_n                                                        (sys_clk_reset_n),
      .select_n_to_the_cfi_flash                                      (select_n_to_the_cfi_flash),
      .write_n_to_the_cfi_flash                                       (write_n_to_the_cfi_flash)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_reset_sys_clk_domain_synch_module nios_reset_sys_clk_domain_synch
    (
      .clk      (sys_clk),
      .data_in  (1'b1),
      .data_out (sys_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    nios_fast_jtag_debug_module_resetrequest_from_sa |
    nios_fast_jtag_debug_module_resetrequest_from_sa);


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 21: 0] rdaddress;
  input            rdclken;
  input   [ 21: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [4194303: 0];
  wire    [  7: 0] q;
  reg     [ 21: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      if (1)
          read_address <= rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      if (1)
//          read_address <= rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 22,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [  7: 0] data;
  input   [ 21: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [  7: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_lane0, which is an e_ram
  cfi_flash_lane0_module cfi_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? q_0: {8{1'bz}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "d:/altera/72/quartus/eda/sim_lib/altera_mf.v"
`include "d:/altera/72/quartus/eda/sim_lib/220model.v"
`include "d:/altera/72/quartus/eda/sim_lib/sgate.v"
`include "sram_16bit_0.v"
`include "D:/altera/72/nios2eds/components/SRAM_16Bit_512K/hdl/SRAM_16Bit_512K.v"
`include "freq_avalon_0.v"
`include "Double_ADS805_0.v"
`include "lcd_rst_n.v"
`include "BUTTON_PIO.v"
`include "lcd_sck.v"
`include "lcd_AO.v"
`include "sys_timer.v"
`include "lcd_si.v"
`include "lcd_cs_n.v"
`include "nios_fast_test_bench.v"
`include "nios_fast_mult_cell.v"
`include "nios_fast_jtag_debug_module.v"
`include "nios_fast_jtag_debug_module_wrapper.v"
`include "nios_fast.v"
`include "jtag_uart.v"
`include "epcs_controller.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [ 17: 0] SRAM_ADDR_from_the_sram_16bit_0;
  wire             SRAM_CE_N_from_the_sram_16bit_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_16bit_0;
  wire             SRAM_LB_N_from_the_sram_16bit_0;
  wire             SRAM_OE_N_from_the_sram_16bit_0;
  wire             SRAM_UB_N_from_the_sram_16bit_0;
  wire             SRAM_WE_N_from_the_sram_16bit_0;
  wire             ad_clk_from_the_freq_avalon_0;
  wire             ad_clk_to_the_Double_ADS805_0;
  wire    [ 21: 0] address_to_the_cfi_flash;
  wire             clk;
  wire    [  7: 0] data_to_and_from_the_cfi_flash;
  wire             epcs_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_controller_epcs_control_port_readyfordata_from_sa;
  wire             freq_in_to_the_freq_avalon_0;
  wire    [ 11: 0] i_input_to_the_Double_ADS805_0;
  wire    [  4: 0] in_port_to_the_BUTTON_PIO;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             out_port_from_the_lcd_AO;
  wire             out_port_from_the_lcd_cs_n;
  wire             out_port_from_the_lcd_rst_n;
  wire             out_port_from_the_lcd_sck;
  wire             out_port_from_the_lcd_si;
  wire             read_n_to_the_cfi_flash;
  reg              reset_n;
  wire             select_n_to_the_cfi_flash;
  reg              sys_clk;
  wire    [ 11: 0] u_input_to_the_Double_ADS805_0;
  wire             write_n_to_the_cfi_flash;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios DUT
    (
      .SRAM_ADDR_from_the_sram_16bit_0      (SRAM_ADDR_from_the_sram_16bit_0),
      .SRAM_CE_N_from_the_sram_16bit_0      (SRAM_CE_N_from_the_sram_16bit_0),
      .SRAM_DQ_to_and_from_the_sram_16bit_0 (SRAM_DQ_to_and_from_the_sram_16bit_0),
      .SRAM_LB_N_from_the_sram_16bit_0      (SRAM_LB_N_from_the_sram_16bit_0),
      .SRAM_OE_N_from_the_sram_16bit_0      (SRAM_OE_N_from_the_sram_16bit_0),
      .SRAM_UB_N_from_the_sram_16bit_0      (SRAM_UB_N_from_the_sram_16bit_0),
      .SRAM_WE_N_from_the_sram_16bit_0      (SRAM_WE_N_from_the_sram_16bit_0),
      .ad_clk_from_the_freq_avalon_0        (ad_clk_from_the_freq_avalon_0),
      .ad_clk_to_the_Double_ADS805_0        (ad_clk_to_the_Double_ADS805_0),
      .address_to_the_cfi_flash             (address_to_the_cfi_flash),
      .data_to_and_from_the_cfi_flash       (data_to_and_from_the_cfi_flash),
      .freq_in_to_the_freq_avalon_0         (freq_in_to_the_freq_avalon_0),
      .i_input_to_the_Double_ADS805_0       (i_input_to_the_Double_ADS805_0),
      .in_port_to_the_BUTTON_PIO            (in_port_to_the_BUTTON_PIO),
      .out_port_from_the_lcd_AO             (out_port_from_the_lcd_AO),
      .out_port_from_the_lcd_cs_n           (out_port_from_the_lcd_cs_n),
      .out_port_from_the_lcd_rst_n          (out_port_from_the_lcd_rst_n),
      .out_port_from_the_lcd_sck            (out_port_from_the_lcd_sck),
      .out_port_from_the_lcd_si             (out_port_from_the_lcd_si),
      .read_n_to_the_cfi_flash              (read_n_to_the_cfi_flash),
      .reset_n                              (reset_n),
      .select_n_to_the_cfi_flash            (select_n_to_the_cfi_flash),
      .sys_clk                              (sys_clk),
      .u_input_to_the_Double_ADS805_0       (u_input_to_the_Double_ADS805_0),
      .write_n_to_the_cfi_flash             (write_n_to_the_cfi_flash)
    );

  //default value specified in MODULE BUTTON_PIO ptf port section
  assign in_port_to_the_BUTTON_PIO = 0;

  cfi_flash the_cfi_flash
    (
      .address  (address_to_the_cfi_flash),
      .data     (data_to_and_from_the_cfi_flash),
      .read_n   (read_n_to_the_cfi_flash),
      .select_n (select_n_to_the_cfi_flash),
      .write_n  (write_n_to_the_cfi_flash)
    );

  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end
  initial
    sys_clk = 1'b0;
  always
     if (sys_clk == 1'b1) 
    #6 sys_clk <= ~sys_clk;
     else 
    #7 sys_clk <= ~sys_clk;
  

endmodule


//synthesis translate_on