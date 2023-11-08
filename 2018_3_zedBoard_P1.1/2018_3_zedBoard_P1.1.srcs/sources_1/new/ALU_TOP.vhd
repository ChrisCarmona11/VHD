----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2023 20:09:55
-- Design Name: 
-- Module Name: ALU_TOP - Behavioral
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

entity ALU_TOP is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 4);
           B : in STD_LOGIC_VECTOR (7 downto 4);
           OPERA : in STD_LOGIC_VECTOR (1 downto 0);
           PRODUCTO : OUT STD_LOGIC_VECTOR(8 downto 2);
           COUT : OUT STD_LOGIC);
end ALU_TOP;

architecture Behavioral of ALU_TOP is
component ALU_n_bits
      GENERIC(bit_size:integer:=8);
      Port ( A : in STD_LOGIC_VECTOR (bit_size-1 downto 0);
           B : in STD_LOGIC_VECTOR (bit_size-1 downto 0);
           OPERA : in STD_LOGIC_VECTOR (1 downto 0);
           PRODUCTO : out STD_LOGIC_VECTOR (bit_size downto 0);
           COUT : out STD_LOGIC);
end component; 
Signal s_a,s_b : std_logic_vector(7 downto 0);
signal s_opera : std_logic_vector(1 downto 0);
signal s_producto: std_logic_vector(8 downto 0);
signal s_cout: std_logic;
begin
s_a <= A&"0000";
s_b <= B&"0000";
s_opera <= OPERA;


U1: ALU_n_bits port map (s_a,s_b,s_opera,s_producto,s_cout);

PRODUCTO<=s_producto(8 downto 2);
cout<= s_cout;

end Behavioral;
