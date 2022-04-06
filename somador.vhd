use IEEE.STD_LOGIC_ARITH.all;
use IEEE.NUMERIC_STD.all;

entity somador is 
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			b: in STD_LOGIC_VECTOR(7 downto 0);
			s: out STD_LOGIC_VECTOR(15 downto 0));
end somador;

architecture asynth of somador is
signal soma, b1: signed(15 downto 0);
begin
	b1<=b(7)&b;
	s<=std_logic_vector((signed(a)+b1)-"0000000000000001");
end;