class_name StateMachine; extends Node;

@export                                     var active_states : Array[State];

func _ready() -> void:
    for state:                         State in active_states :
        state.TransitionFromTo.connect(State_TransitionFromTo);
        state._enter();
        pass;
    pass;

func          _input(event: InputEvent)      -> void:
    for state: State        in         active_states:
        state._input(event)                         ;
        pass;
    pass;

func                  _process(delta: float) -> void:
    for state: State in active_states:
        state.        _process(delta);
        pass;
    pass;

func          _physics_process(delta: float) -> void:
    for state: State in active_states:
        state._physics_process(delta);
        pass;
    pass;

func State_TransitionFromTo(
 old_state: State          ,
 new_state: State          ):
    active_states.erase (old_state);
    old_state.TransitionFromTo.disconnect(State_TransitionFromTo);
    old_state._leave();
    new_state.TransitionFromTo.   connect(State_TransitionFromTo);
    new_state._enter();
    active_states.append(new_state);
    pass;
