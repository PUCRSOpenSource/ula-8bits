library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TB is
    end TB;
architecture TB of TB is
    signal a, b, output: std_logic_vector(7 downto 0);
    signal op :          std_logic_vector(2 downto 0);
    signal carry_out:    std_logic;
    signal negative:     std_logic;
    signal zero:         std_logic;
    signal overflow:     std_logic;
    signal arithmetic:   std_logic_vector(7 downto 0);
    signal logic:         std_logic_vector(7 downto 0);
begin

    process 
    begin
        a   <="00000000", "11011001" after 40ns;
        wait for 80ns;
    end process;
	 
    process
    begin
        b   <="00000000", "1010011" after 20ns;
        wait for 40ns;
    end process;


        op  <="000", "001" after 40ns, "010" after 80ns, "011" after 120ns,
              "100" after 160ns, "101" after 200ns, "110" after 240ns, "111" after 280ns;

    arthm: entity work.Adder8    
           port map(op => op(1 downto 0),                
                    a  => a,                          
                    b  => b, 
                    carry_out => carry_out, 
                    negative  => negative, 
                    zero      => zero,
                    overflow  => overflow,
                    s         => arithmetic
                   );
    logc: entity work.Logic8
          port map( a  => a,
                    b  => b,
                    op => op(1 downto 0),
                    s  => logic
                  );
    mux: entity work.Mux
         port map(op => op(2),
                  arithmetic => arithmetic,
                  logic      => logic,
                  output     => output
              );         
    
end tb;
