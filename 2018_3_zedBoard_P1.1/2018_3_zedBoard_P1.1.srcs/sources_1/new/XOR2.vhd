----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 22:44:13
-- Design Name: 
-- Module Name: XOR2 - Behavioral
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

entity XOR2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           o : out STD_LOGIC);
end XOR2;

architecture Behavioral of XOR2 is

begin
o<= a XOR b;

end Behavioral;
