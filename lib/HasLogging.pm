use MooseX::Declare;
role HasLogging(Str :$target_method!) {
    require Data::Dumper;
    requires $target_method;
    before "$target_method" (@args) {
        warn "$target_method was called with " . Data::Dumper::Dumper(\@args);
    }
}
