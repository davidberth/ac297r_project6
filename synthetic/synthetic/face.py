import cairo
import fire

# face specific constants
WIDTH, HEIGHT = 1024, 1024
FACE_RADIUS = min(WIDTH, HEIGHT) / 6
EYE_RADIUS = FACE_RADIUS / 6
PUPIL_RADIUS = EYE_RADIUS * 0.75

# available eye colors
eye_colors_rgb = [
    (0.39, 0.26, 0.13),  # Dark Brown
    (0.58, 0.34, 0.10),  # Light Brown / Hazel
    (0.26, 0.50, 0.72),  # Blue
    (0.15, 0.58, 0.40),  # Green
    (0.77, 0.57, 0.39),  # Amber
    (0.58, 0.58, 0.58),  # Gray
    (0.82, 0.70, 0.55),  # Honey
    (0.0, 0.5, 0.5),  # Teal
    (0.70, 0.42, 0.14),  # Golden
    (0.62, 0.32, 0.17),  # Copper
]


def render_face(red, green, blue, eye_color_index, smile_factor):
    """Renders a face dynamically onto a 2D texture

    Args:
        red (float): the red component for the skin
        green (float): the green component for the skin
        blue (float): the blue component for the skin
        eye_color_index (int): the index of the eye color to use (see constants above)
        smile_factor (float): a floating point number between -100 (full frown) and 100 (full smile)
    """

    # setup cairo context
    surface = cairo.ImageSurface(cairo.FORMAT_ARGB32, WIDTH, HEIGHT)
    ctx = cairo.Context(surface)

    ctx.set_source_rgb(red, green, blue)
    ctx.rectangle(0, 0, WIDTH, HEIGHT)
    ctx.fill()

    eye_red, eye_green, eye_blue = eye_colors_rgb[eye_color_index]

    # draw eyes
    ctx.set_source_rgb(0, 0, 0)  # black

    eye_x = WIDTH / 2 - FACE_RADIUS / 3
    eye_y = HEIGHT / 2 - FACE_RADIUS / 3 + 80

    for _ in range(2):
        # outer ellipse
        ctx.set_source_rgb(0.9, 0.9, 0.9)
        ctx.save()
        ctx.translate(eye_x, eye_y)
        ctx.scale(1, 1.3)  # ellipse is scale of circle in y direction
        ctx.arc(0, 0, EYE_RADIUS, 0, 2 * 3.14159)
        ctx.restore()  # restore used to remove the scale transformation
        ctx.fill()

        # inner pupil
        ctx.set_source_rgb(eye_red, eye_green, eye_blue)  # black
        ctx.arc(eye_x, eye_y + 15, PUPIL_RADIUS, 0, 2 * 3.14159)
        ctx.fill()

        # eye outline
        ctx.save()
        ctx.set_source_rgb(0, 0, 0)  # black
        ctx.set_line_width(3.0)
        ctx.translate(eye_x, eye_y)
        ctx.scale(1, 1.3)  # ellipse is from circle in y direction
        ctx.arc(0, 0, EYE_RADIUS, 0, 2 * 3.14)
        ctx.stroke()
        ctx.restore()

        # eye brow
        ctx.save()
        ctx.set_source_rgb(0, 0, 0)  # black
        ctx.set_line_width(12.0)

        brow_factor = 10
        brow_height = 60

        ctx.move_to(eye_x - 20, eye_y - brow_height)
        ctx.curve_to(
            eye_x - 10,
            eye_y - brow_height - brow_factor,
            eye_x + 10,
            eye_y - brow_height - brow_factor,
            eye_x + 20,
            eye_y - brow_height,
        )
        ctx.stroke()
        ctx.restore()

        eye_x += FACE_RADIUS * 2 / 3  # move to right for second eye

    # draw mouth
    ctx.set_source_rgb(0, 0, 0)  # black
    ctx.set_line_width(14.0)
    ctx.move_to(
        WIDTH / 2 - FACE_RADIUS / 4.5, HEIGHT / 2 + FACE_RADIUS / 2 + 50
    )
    ctx.curve_to(
        WIDTH / 2 - FACE_RADIUS / 8,
        HEIGHT / 2 + FACE_RADIUS / 2 + 50 + smile_factor,
        WIDTH / 2 + FACE_RADIUS / 8,
        HEIGHT / 2 + FACE_RADIUS / 2 + 50 + smile_factor,
        WIDTH / 2 + FACE_RADIUS / 4.5,
        HEIGHT / 2 + FACE_RADIUS / 2 + 50,
    )
    ctx.stroke()

    # output to image file
    surface.write_to_png("textures/faces/face.png")


if __name__ == "__main__":
    fire.Fire(render_face)
