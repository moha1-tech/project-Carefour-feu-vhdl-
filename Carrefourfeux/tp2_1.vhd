
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:58:53 03/13/2019
-- Design Name:   Carrefourfeux
-- Module Name:   E:/TP_VHDL/Carrefourfeux/tp2_1.vhd
-- Project Name:  Carrefourfeux
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Carrefourfeux
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tp2_1_vhd IS
END tp2_1_vhd;

ARCHITECTURE behavior OF tp2_1_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT Carrefourfeux
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		DETECTION : IN std_logic;          
		Rp : OUT std_logic;
		Op : OUT std_logic;
		Vp : OUT std_logic;
		Rs : OUT std_logic;
		Os : OUT std_logic;
		Vs : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL CLK :  std_logic := '0';
	SIGNAL RESET :  std_logic := '0';
	SIGNAL DETECTION :  std_logic := '0';

	--Outputs
	SIGNAL Rp :  std_logic;
	SIGNAL Op :  std_logic;
	SIGNAL Vp :  std_logic;
	SIGNAL Rs :  std_logic;
	SIGNAL Os :  std_logic;
	SIGNAL Vs :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: Carrefourfeux PORT MAP(
		CLK => CLK,
		RESET => RESET,
		DETECTION => DETECTION,
		Rp => Rp,
		Op => Op,
		Vp => Vp,
		Rs => Rs,
		Os => Os,
		Vs => Vs
	);

	tb : PROCESS
	BEGIN
clk<='1' ; wait for 10 ns ;
clk<='0' ; wait for 10 ns;
	END PROCESS;
detection <='0' after 1 us ,'1' after 2 us ,'0' after 200 us , '1' after 201 us ;
reset<='1' ,'0' after 100 ns ;
END;
