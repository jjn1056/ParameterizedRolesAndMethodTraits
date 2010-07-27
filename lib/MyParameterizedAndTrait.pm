use MooseX::Declare;
class MyParameterizedAndTrait {
    method title(Str $string)
    does MyMethodTrait(tag=>"p")
    {       
        return "'$string' is the title";
    }
    with 'MyParameterizableRole' => {
        target_method => "title",
        prefix => "FAQ",
    };
}
