class_name State; extends Node;

signal TransitionFromTo(old_state: State, new_state: State);

func _ready()   -> void:
    process_mode = Node.PROCESS_MODE_DISABLED;
    pass;

func _enter()   -> void:
    pass;

func _leave()   -> void:
    pass;

func _input(_event: InputEvent) -> void:
    pass;

func _physics_process(_delta: float) -> void:
    pass;

func         _process(_delta: float) -> void:
    pass;

func               change_state(new_state: State) -> void:
    TransitionFromTo.emit(self, new_state)               ;
    pass;
