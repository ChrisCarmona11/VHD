----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 22:44:13
-- Design Name: 
-- Module Name: MUX2to1 - Behavioral
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

entity MUX2to1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sel : in STD_LOGIC;
           o : out STD_LOGIC);
end MUX2to1;

architecture Behavioral of MUX2to1 is

begin

    process (sel,a,b)
    Begin
        if sel= '0' then o <= a;
        else o <= b;
        end if;
    end process;

end Behavioral;
