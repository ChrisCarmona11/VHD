----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2023 15:49:54
-- Design Name: 
-- Module Name: Multiplication_TOP - Behavioral
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

entity Multiplication_TOP is
    Port ( A : in STD_LOGIC_VECTOR (6 downto 3);
           B : in STD_LOGIC_VECTOR (7 downto 4);
           Result : OUT STD_LOGIC_VECTOR (12 downto 5));
end Multiplication_TOP;

architecture Behavioral of Multiplication_TOP is
component Multi6x7 is
    GENERIC( COLS: INTEGER:=6;
             ROWS: INTEGER:=7);
    Port ( A : in STD_LOGIC_VECTOR (cols-1 downto 0);
           B : in STD_LOGIC_VECTOR (rows-1 downto 0);
           RESULT : OUT STD_LOGIC_VECTOR (cols+rows-1 downto 0));
end component;
signal s_a: std_logic_vector(5 downto 0);
signal s_b: std_logic_vector(6 downto 0);
signal s_r: std_logic_vector(12 downto 0);
begin
U1: Multi6x7 port map (s_a,s_b,s_r);
s_a<= a&"00";
s_b<= B&"000";
Result<=s_r(12 downto 5);
end Behavioral;
