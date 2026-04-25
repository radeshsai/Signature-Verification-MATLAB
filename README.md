# Signature Verification using MATLAB

A MATLAB-based system that verifies whether two handwritten signatures match.

## How it Works
1. Reads two signature images and converts to grayscale
2. Enhances images using Histogram Equalization
3. Detects features using FAST algorithm
4. Matches features between both signatures
5. If matched points exceed threshold → Signatures Matched

## Technologies Used
- MATLAB
- Image Processing Toolbox
- FAST Feature Detection
- Histogram Equalization

## How to Run
1. Place your signature images in the same folder as the code
2. Rename them as sign01.jpg and sign02.jpg
3. Run the signverficationMatlabCode.m file in MATLAB

## Result
- Same signatures → Signatures Matched
- Different signatures → Signatures Not Matched
