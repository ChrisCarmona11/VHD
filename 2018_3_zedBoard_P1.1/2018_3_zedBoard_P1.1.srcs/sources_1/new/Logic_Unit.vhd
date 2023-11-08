----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2023 14:17:57
-- Design Name: 
-- Module Name: Logic_Unit - Behavioral
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

entity Logic_Unit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SIGN : in STD_LOGIC;
           OPERA : in STD_LOGIC_vector(1 downto 0);
           SUMRES : in STD_LOGIC;
           RESULT : out STD_LOGIC);
end Logic_Unit;

architecture Behavioral of Logic_Unit is
component MUX2to1
    port(A,B,SEL: in std_logic;
         O: out std_logic);
end component;
component MUX4to1
    port(A,B,C,D: in std_logic;
         SEL: in std_logic_vector(1 downto 0);
         O: out std_logic);
end component;
signal s_sumres: std_logic;
signal s_a,s_b : std_logic;
signal s_mux_max,s_mux_min:std_logic;
signal s_result: std_logic;

begin
s_sumres<=SUMRES;
mux2to1_u1: MUX2to1 Port map (A,B,SIGN,s_mux_min);--Asignación posicional
mux2to1_u2: MUX2to1 Port map (A=>B,B=>A,SEL=>SIGN,O=>s_mux_max);--Asignación referenciada
mux4to1_u1: MUX4to1 Port map(s_sumres,s_sumres,s_mux_max,s_mux_min,OPERA,s_result);

RESULT<=s_result;

end Behavioral;
