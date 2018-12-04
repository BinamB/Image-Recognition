startImagePath = 'C:\Users\Binam B\Desktop\matlab\Library';
startDataPath = 'C:\Users\Binam B\Desktop\matlab\saved';
artistNames = {'Monet', 'Picasso', 'Gogh', 'Kahlo', 'Seurat', 'Matisse', 'Hokusai', 'Dali'}; 

for i = 1:5
    for artist = 1:numel(artistNames)
        imagePath = [startImagePath '\' artistNames{artist}];
        dataPath = [startDataPath '\' artistNames{artist} '\TrainingSet'];
    
        allNames = dir([imagePath '/*.jpg']);
    
        elem = randperm(numel(allNames), 25);
    
        makeDir([dataPath '/']);
       
        saveFile = [dataPath '/' 'testSamples' 'mat'];
%       inputFileName = [imagePath '/' allNames(x).name];
        TrainingSet = elem; 
        save(saveFile,'TrainingSet');
        
    end
end