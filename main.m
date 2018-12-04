close all; clear all; fclose all;clc;
startImagePath = 'C:\Users\Binam B\Desktop\Stuff\MATLAB(1)\matlab\Library';
startDataPath = 'C:\Users\Binam B\Desktop\Stuff\MATLAB(1)\matlab\saved';
artistNames = {'Monet', 'Picasso', 'Gogh', 'Kahlo', 'Seurat', 'Matisse', 'Hokusai', 'Dali'}; % make sure you use same spellings and case as foldernames

for artist = 1:numel(artistNames)
    imagePath = [startImagePath '\' artistNames{artist}];
    dataPath1 = [startDataPath '\' artistNames{artist} '\LBP'];
     
    allNames = dir([imagePath '/*.jpg']);
    dataPath2 = [startDataPath '\' artistNames{artist} '\colorHistogram']; 
    
    dataPath3 = [startDataPath '\' artistNames{artist} '\tinyImage'];
    makeDir([dataPath2 '/']); 
    makeDir([dataPath1 '/']);
    makeDir([dataPath3 '/']);
    
    for x = 1:numel(allNames)
        saveFile = [dataPath1 '/' allNames(x).name(1:end-3) 'mat'];
        inputFileName = [imagePath '/' allNames(x).name];
        inputImage = imread(inputFileName);
        if(strcmp(artistNames{artist},'monet'))
            inputImage = removeBorders(inputImage);
        end
            
        LBP = lbp(inputImage);
        save(saveFile,'LBP');
        
        saveFile = [dataPath3 '/' allNames(x).name(1:end-3) 'mat'];
        inputFileName = [imagePath '/' allNames(x).name];
        inputImage = imread(inputFileName);
        if(strcmp(artistNames{artist},'monet'))
            inputImage = removeBorders(inputImage);
        end
            
        tiny = tinyImage(inputImage);
        save(saveFile,'tiny');
        
         saveFile = [dataPath2 '/' allNames(x).name(1:end-3) 'mat'];
        inputFileName = [imagePath '/' allNames(x).name];
        inputImage = imread(inputFileName);
        if(strcmp(artistNames{artist},'monet'))
            inputImage = removeBorders(inputImage);
        end
            
        hist = colorHistogram(inputImage);
        save(saveFile,'hist');
    end
end   