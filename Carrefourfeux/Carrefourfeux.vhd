----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:40:24 03/13/2019 
-- Design Name: 
-- Module Name:    Carrefourfeux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Carrefourfeux is
    Port ( CLK,RESET,DETECTION : in  STD_LOGIC;
           Rp,Op,Vp : out STD_LOGIC;
           Rs,Os,Vs : out  STD_LOGIC);
end Carrefourfeux;

architecture Behavioral of Carrefourfeux is
Type etat is(etat_defaut,etat_oprs,etat_rprs,etat_rpvs,etat_rpos,etat_rsrp,etat_vprs);
signal etat_ac,etat_fu : etat ;
signal en1mhz : std_logic;
constant fincpt1mhz : natural := 50;
signal cpt1mhz : natural range 0 to fincpt1mhz -1 ;
constant fincpt130 : natural := 130 ;
signal cpt130 : natural range 0 to fincpt130 -1 ;

begin

--bloc1
process(CLK,RESET)
begin
if RESET='1' then cpt1mhz <= 0;
elsif rising_edge(clk) then
     if cpt1mhz = fincpt1mhz - 1 then cpt1mhz <= 0;
	  else cpt1mhz <= cpt1mhz +1 ; 
	  end if ;
end if;
end process ;
en1mhz <= '1' when cpt1mhz = fincpt1mhz - 1 else '0' ; 
--bloc2
process(clk,reset)
begin
if reset='1' then cpt130 <= 0;
elsif rising_edge(clk) then
if  en1mhz='1' then
   if cpt130 = fincpt130 - 1 or etat_ac=etat_defaut then cpt130 <= 0;
   else cpt130 <= cpt130 + 1 ;
    end if;
end if;
end if;
end process ;
 --bloc3
 process(clk,reset,DETECTION,etat_ac,cpt130)
 begin
 if reset='1' then  etat_fu <= etat_defaut;
 else case etat_ac is
  when etat_defaut => if detection = '1' then etat_fu <= etat_oprs; else etat_fu <= etat_defaut; end if;
  when etat_oprs   => if cpt130 = 9 then etat_fu  <= etat_rprs; else etat_fu <= etat_oprs; end if;
  when etat_rprs   => if cpt130 = 19  then etat_fu <= etat_rpvs; else etat_fu <= etat_oprs; end if;
  when etat_rpvs   => if cpt130 = 49  then etat_fu <= etat_rpos; else etat_fu <= etat_rprs; end if;
  when etat_rpos   => if cpt130 = 69  then etat_fu <= etat_rsrp; else etat_fu <= etat_rpvs; end if;
  when etat_rsrp   => if cpt130 = 79  then etat_fu <= etat_vprs; else etat_fu <= etat_rsrp; end if;
  when etat_vprs   => if cpt130 = 129 then etat_fu <= etat_defaut; else etat_fu <= etat_vprs; end if;
  when others => etat_fu <=etat_defaut;

end case;
end if;
end process;  
--bloc4
process(clk,reset)
begin
if reset='1' then etat_ac <= etat_defaut;
elsif rising_edge(clk) then  etat_ac <= etat_fu;
end if;
end process;	 
--bloc5
process(etat_ac)
begin
  Rp <= '0' ;Op <= '0'; Vp <='0'  ; Rs <= '0' ; Os <= '0'; Vs <= '0';
  case etat_ac is
  when etat_defaut =>  Vp <='1'  ; Rs <= '1';
  when etat_oprs   =>  Op <= '1' ; Rs <= '1';
  when etat_rprs   =>  Rp <='1'  ; Rs <= '1';
  when etat_rpvs   =>  Rp <='1'  ; Vs <= '1';
  when etat_rpos   =>  Rp <='1'  ; Os <= '1';
  when etat_rsrp   =>  Rs <= '1' ; Rp <='1' ;
  when etat_vprs   =>  Vp <='1'  ; Rs <= '1';
  when others      =>  Vp <='1'  ; Rs <= '1';
end case;
end process;  
  
end Behavioral;

