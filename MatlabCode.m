% Read and convert images to grayscale
I1 = rgb2gray(imread("sign01.jpg"));
I2 = rgb2gray(imread("sign02.jpg"));

% Enhance images using Fourier Transform
I1_enhanced = enhanceImageWithFourier(I1);
I2_enhanced = enhanceImageWithFourier(I2);

% Display the original and enhanced images
figure;
subplot(2,2,1);
imshow(I1);
title('Original Image 1');
subplot(2,2,2);
imshow(I1_enhanced);
title('Enhanced Image 1');
subplot(2,2,3);
imshow(I2);
title('Original Image 2');
subplot(2,2,4);
imshow(I2_enhanced);
title('Enhanced Image 2');

% Detect FAST features in the enhanced images
points1 = detectFASTFeatures(I1_enhanced);
points2 = detectFASTFeatures(I2_enhanced);

% Plot detected points
figure;
imshow(I1_enhanced); hold on;
plot(points1);
title('FAST Features in Enhanced Image 1');

figure;
imshow(I2_enhanced); hold on;
plot(points2);
title('FAST Features in Enhanced Image 2');

% Extract features (descriptors) from the detected points
[features1, valid_points1] = extractFeatures(I1_enhanced, points1);
[features2, valid_points2] = extractFeatures(I2_enhanced, points2);

% Match the features between the two images
indexPairs = matchFeatures(features1, features2);

% Get the matched points
matchedPoints1 = valid_points1(indexPairs(:, 1));
matchedPoints2 = valid_points2(indexPairs(:, 2));

% Display matched features
figure;
showMatchedFeatures(I1_enhanced, I2_enhanced, matchedPoints1, matchedPoints2);
title('Matched Points Between Enhanced Signatures');

% Set a threshold for the number of matches
minMatches = 5; % Adjust this threshold based on your needs

% Check if the number of matched points is above the threshold
if size(matchedPoints1, 1) >= minMatches
    disp('Signatures Matched');
else
    disp('Signatures Not Matched');
end

