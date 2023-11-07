%All Codewords
clc
generatorMatrix = [1 1 1 1 0 0 0; 1 0 1 0 1 0 0; 0 1 1 0 0 1 0; 1 1 0 0 0 0 1];
decimals = (0:15)';
messages = de2bi(decimals,'left-msb');
codewordVectors = messages*generatorMatrix;
decimalMessages = [decimals messages]
codeword = mod(codewordVectors,2)

%Parity-check matrix
identityMatrix = eye(3)';
parity = [1 1 1; 1 0 1; 0 1 1; 1 1 0];
transposeMatrix = transpose(parity);
mergedMatrix = [identityMatrix transposeMatrix]

%Syndrome for the received vector
receivedVector = [1 1 0 1 1 0 1];
transposeMerged = transpose(mergedMatrix);
syndromeVector = receivedVector*transposeMerged;
syndrome = mod(syndromeVector,2)