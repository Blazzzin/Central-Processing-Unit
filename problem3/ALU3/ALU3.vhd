library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ALU3 is

	port (Clock : in std_logic;
			A, B : in unsigned(7 downto 0);
			student_id : in unsigned(3 downto 0);
			OP : in unsigned(15 downto 0);
			Result : out unsigned(3 downto 0));
end ALU3;

Architecture calculation of ALU3 is
	signal ResultF : unsigned(3 DOWNTO 0) := (others => '0');

	Begin
		-- Determine if student_id is odd
		ResultF <= (others => '1') when (student_id mod 2) = 0 else (others => '0');
		-- '1111' when it is even (sseg needs to have 'n')
		-- '0000' when it is odd (sseg needs to have 'y')
	
	Result <= ResultF;
	
end calculation;