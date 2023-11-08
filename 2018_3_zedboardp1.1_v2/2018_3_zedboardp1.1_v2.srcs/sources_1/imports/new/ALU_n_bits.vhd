----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2023 15:25:32
-- Design Name: 
-- Module Name: ALU_n_bits - Behavioral
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

entity ALU_n_bits is
    GENERIC(bit_size:integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (bit_size-1 downto 0);
           B : in STD_LOGIC_VECTOR (bit_size-1 downto 0);
           OPERA : in STD_LOGIC_VECTOR (1 downto 0);
           PRODUCTO : out STD_LOGIC_VECTOR (bit_size downto 0);
           COUT : out STD_LOGIC);
           
end ALU_n_bits;

architecture Behavioral of ALU_n_bits is
component ALU_1_bit
     Port (A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           SIGN : in STD_LOGIC;
           OPERA : in STD_LOGIC_vector(1 downto 0);
           COUT : out STD_LOGIC;
           RESULT : out STD_LOGIC);
end component;
signal s_carry: std_logic_vector(bit_size+1 downto 0);
signal s_result: std_logic_vector(bit_size downto 0);
signal s_f_opera:std_logic;
begin
    s_f_opera<=opera(1) or opera(0);
    ALU_1_bit_u1:ALU_1_bit port map (a(0),b(0),s_f_opera,s_carry(bit_size+1),opera,s_carry(1),s_result(0));
bloques:for i in 1 to bit_size-1 generate
    ALU_1_bit_uN:ALU_1_bit port map (a(i),b(i),s_carry(i),s_carry(bit_size+1),opera,s_carry(i+1),s_result(i));
end generate;
    ALU_1_bit_u9:ALU_1_bit port map ('0','0',s_carry(bit_size),s_carry(bit_size+1),opera,s_carry(bit_size+1),s_result(bit_size));

PRODUCTO<=s_result;
COUT<=s_carry(bit_size+1);

end Behavioral;