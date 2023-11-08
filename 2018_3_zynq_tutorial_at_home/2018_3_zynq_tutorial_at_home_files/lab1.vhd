----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2019 10:32:49
-- Design Name: 
-- Module Name: lab1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab1 is
    Port ( swt : in STD_LOGIC_VECTOR (7 downto 0);
           led: out STD_LOGIC_VECTOR (7 downto 0));
end lab1;

architecture Behavioral of lab1 is

signal led_aux: STD_LOGIC_VECTOR (7 downto 0);

begin
    led_aux(0)<=not(swt(0));
    led_aux(1)<=swt(1) and not(swt(2));
    led_aux(3)<=swt(2) and swt(3);
    
    led(7 downto 4)<=swt(7 downto 4);   
    led(2)<=led_aux(1) or led_aux(3);
    led(0)<=led_aux(0);
    led(1)<=led_aux(1);
    led(3)<=led_aux(3);

end Behavioral;
