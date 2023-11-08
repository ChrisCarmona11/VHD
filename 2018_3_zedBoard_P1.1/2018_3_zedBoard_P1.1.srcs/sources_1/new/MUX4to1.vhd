----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 22:44:13
-- Design Name: 
-- Module Name: MUX4to1 - Behavioral
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

entity MUX4to1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           sel : in std_logic_vector(1 downto 0);
           o : out STD_LOGIC);
end MUX4to1;

architecture Behavioral of MUX4to1 is

begin
    process (sel,a,b,c,d)
    begin
        if sel= "00" then o<=a;
        elsif sel= "01" then o<=b;
        elsif sel= "10" then o<=c;
        else o<=d;
        end if ;
    end process;
end Behavioral;
