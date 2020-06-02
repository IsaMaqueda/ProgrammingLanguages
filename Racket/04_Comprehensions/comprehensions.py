import math

def get_perimeters(circles):

    #return list(map(lambda r: r * 2 * math.pi, circles))

    return [r * 2 * math.pi for r in circles if r > 0]

    result = []
    for r in circles:
        if r > 0:
            result.append(r * 2 * math.pi)
    return result
