library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity flag0 is
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			y: out STD_LOGIC);
end flag0;

architecture synth of flag0 is
	signal i: integer;
	signal x: STD_LOGIC_VECTOR(15 downto 1);
begin -- N-bit AND of inverted inputs

	-- Verifica se o valor de a é igual a 0x0000
	with a select
	y <= '1' when "0000000000000000",
	     '0' when others;
end synth;
