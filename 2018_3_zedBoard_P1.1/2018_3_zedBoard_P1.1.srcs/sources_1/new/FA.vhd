----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 22:44:13
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           result : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

begin

cout <= (a and b) or (a and cin) or (b and cin);
result <= (a and not(b) and not(cin)) or (b and not(a) and not(cin)) or (cin and not(b) and not(a)) or (a and b and cin);

end Behavioral;
