----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2023 21:26:37
-- Design Name: 
-- Module Name: ALU_n_bits_tb - Behavioral
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

entity ALU_n_bits_tb is
end ALU_n_bits_tb;

architecture Behavioral of ALU_n_bits_tb is
    Component ALU_n_bits 
    GENERIC(bit_size:integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (bit_size-1 downto 0);
           B : in STD_LOGIC_VECTOR (bit_size-1 downto 0);
           OPERA : in STD_LOGIC_VECTOR (1 downto 0);
           PRODUCTO : out STD_LOGIC_VECTOR (bit_size downto 0);
           COUT : out STD_LOGIC);
    end component;
signal s_a,s_b: std_logic_vector(7 downto 0);
signal s_opera: std_logic_vector(1 downto 0);
signal s_producto: STD_LOGIC_VECTOR (8 downto 0):="000000000";
signal s_cout: STD_LOGIC;

begin
u1:ALU_n_bits PORT MAP(s_a,s_b,s_opera,s_producto,s_cout);
--s_a<="00000000";
--s_b<="00000000";
--s_opera<="00";
    
tb_process: process
begin
    
    s_a<="00000001";
    s_b<="00000010";
    s_opera<="00";
    
    wait for 100 ns;
    
    s_a<="00000001";
    s_b<="00000010";
    s_opera<="01";
    wait for 100 ns;
    
    s_a<="00000001";
    s_b<="00000010";
    s_opera<="10";
    wait for 100 ns;
    
    s_a<="00000001";
    s_b<="00000010";
    s_opera<="11";
    wait for 100 ns;
    
end process;
end Behavioral;
