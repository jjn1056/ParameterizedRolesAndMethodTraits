use strict; 
use warnings; 
use Test::More; 
 
use_ok 'MyParameterizedAndTrait';

ok my $instance = MyParameterizedAndTrait->new,
  'Created instance';

is $instance->title('Hello'), "<p>'FAQ: Hello' is the title</p>",
  'Works as expected';
   
done_testing; 
