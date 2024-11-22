library verilog;
use verilog.vl_types.all;
entity \4to16decoder\ is
    port(
        y               : out    vl_logic_vector(0 to 15);
        w               : in     vl_logic_vector(3 downto 0);
        En              : in     vl_logic
    );
end \4to16decoder\;
