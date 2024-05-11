def build_scene(components, do_background=True):
    """Builds the scene from the given template components

    Args:
        components (List[Tuple[str, int]]): List of tuples with the component path and type
        do_background (bool, optional): Whether to include the background. Defaults to True.
    Returns:
        the completed template
    """
    template = ""
    for comp, typ in components:
        if typ == 0 or do_background:
            with open(comp, "r") as f:
                template += f.read()

    return template


def save_scene(output_path: str, scene: str):
    """Saves the scene to a given path

    Args:
        output_path (str): Path to save the scene
        scene (str): The scene to save

    Returns:
        None
    """
    with open(output_path, "w") as f:
        f.write(scene)
