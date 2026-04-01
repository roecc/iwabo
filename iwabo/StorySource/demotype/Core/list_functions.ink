
//test with mixList!
=== function ItemByValue(_list, _value) ===
~return LIST_RANGE(LIST_ALL(_list), _value, _value)

=== function ListStep (ref _target, _list, _step) ===
~temp old_state = _target^_list
~temp _new_val = LIST_VALUE(_target^_list)+_step

{ //overflow handling
-_new_val<LIST_VALUE(LIST_MIN(_list)):
    ~_new_val = LIST_VALUE(LIST_MIN(_list))
-_new_val>LIST_VALUE(LIST_MAX(_list)):
    ~_new_val = LIST_VALUE(LIST_MAX(_list))
}
~_target -= old_state
~_target += ItemByValue(_list, _new_val)
//~_target += _list(_new_val) ->breaks bc div reference

=== function ListSetMax (ref _target, _list) ===
~_target -= _target^_list
~_target += ItemByValue(_list, LIST_VALUE(LIST_MAX(_list)))

=== function ListSetMin (ref _target, _list) ===
~_target -= _target^_list
~_target += ItemByValue(_list, LIST_VALUE(LIST_MIN(_list)))