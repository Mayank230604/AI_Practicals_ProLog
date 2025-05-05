% Define frames using the format:
% frame(FrameName, [slot1:value1, slot2:value2, ..., isa:ParentFrame]).

% Base frame for living beings
frame(living_thing, [
    can_breathe:yes,
    can_grow:yes,
    needs_food:yes
]).

% Animal inherits from living thing
frame(animal, [
    isa:living_thing,
    can_move:yes,
    has_heart:yes
]).

% Human inherits from animal
frame(human, [
    isa:animal,
    has_language:yes,
    can_think:yes
]).

% Specific instances
frame(john, [
    isa:human,
    gender:male,
    profession:engineer,
    age:30
]).

frame(mary, [
    isa:human,
    gender:female,
    profession:doctor,
    age:28
]).

% Generic slot accessor with inheritance
get_slot(FrameName, Slot, Value) :-
    frame(FrameName, Slots),
    ( member(Slot:Value, Slots) ->
        true
    ; member(isa:Parent, Slots),
      get_slot(Parent, Slot, Value)
    ).

% get_slot(john, profession, X).
