import numpy as np
import sys
import struct


np.random.seed(43)
filename = sys.argv[1]
type = sys.argv[2]
tile_size = int(sys.argv[3])
matrix_size = int(sys.argv[4])
#fp or int
# weights_shape = [4,4]
# tile_size = 2
weights_shape = [matrix_size,matrix_size]
# tile_size = 4
weights = np.random.randint(0, 10, size=(weights_shape[0], weights_shape[1]))
# print("weights",weights)
inputs = np.random.randint(0, 10, size=(weights_shape[0], weights_shape[1]))
# print("inputs",inputs)

# print("answer",weights @ inputs)
tiles = {}
input_tiles = {}

for i in range(0, weights.shape[0], tile_size):
    for j in range(0, weights.shape[1], tile_size):
        tiles[(i // tile_size, j // tile_size)] = weights[i:i+tile_size, j:j+tile_size]
        input_tiles[(i // tile_size, j // tile_size)] = inputs[i:i+tile_size, j:j+tile_size]


accum = np.zeros((weights.shape[0], weights.shape[1]))
prev_weight = np.zeros((tile_size, tile_size))
with open(f'systolic_array_utils/{filename}.txt', "w") as input_file, open(f'systolic_array_utils/{filename}_output.txt', "w") as output_file:
    for i in range(0, weights.shape[0], tile_size):
        partial = np.zeros((tile_size, weights.shape[1]))
        for j in range(0, weights.shape[1], tile_size):
            for v in range(0, weights.shape[1], tile_size):
                pre_partial = partial.copy()
                curr_weight = tiles[(i//tile_size,j//tile_size)]
                curr_inp = input_tiles[(j//tile_size,v//tile_size)]
                curr_partial = pre_partial[:,v:v+tile_size]
                partial[:,v:v+tile_size] = curr_weight @ curr_inp + curr_partial
                curr_out = partial[:,v:v+tile_size]
                # print("weight tile", curr_weight)
                # print("input vec",curr_inp)
                # print("pre_partial", curr_partial)
                # print("partial", curr_out)
                for row in curr_out:
                        if type == "fp":
                            line = " ".join(str(struct.pack('>e', val).hex()) for val in row)
                        else:
                            line = " ".join(str(int(val)) for val in row)
                        output_file.write(line + "\n")
                # Write weights
                if not np.array_equal(curr_weight, prev_weight):
                    input_file.write("Weights\n")
                    for row in curr_weight:
                        if type == "fp":
                            line = " ".join(str(struct.pack('>e', val).hex()) for val in row)
                        else:
                            line = " ".join(str(int(val)) for val in row)
                        input_file.write(line + "\n")
                prev_weight = curr_weight
                # write inputs
                input_file.write("Inputs\n")
                for row in curr_inp:
                    if type == "fp":
                        line = " ".join(str(struct.pack('>e', val).hex()) for val in row)
                    else:
                        line = " ".join(str(int(val)) for val in row)
                    input_file.write(line + "\n")
                # write partials
                input_file.write("Partials\n")
                for row in curr_partial:
                    if type == "fp":
                        line = " ".join(str(struct.pack('>e', val).hex()) for val in row)
                    else:
                        line = " ".join(str(int(val)) for val in row)
                    input_file.write(line + "\n")
                input_file.write("Multiply\n")
        accum[i:i+tile_size] += partial


# print("my answer", accum)