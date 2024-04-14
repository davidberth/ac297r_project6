import fire
import os
import constants
import options


def test_scene():
    scene_file = "scenes/test.pov"
    output_file = "test/test.png"
    megapov = os.path.join(constants.megapov_path, "megapov")
    opts = options.add(1024, 1024)
    os.system(
        f"{megapov} +I{scene_file} +O{output_file} +FN"
        f" {opts} +L{constants.include_path}"
    )


if __name__ == "__main__":
    test_scene()
