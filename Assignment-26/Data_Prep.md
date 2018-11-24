## Annotate VCF files using the Variant Effect Predictor (VEP) tool

Below are some bash commands that were used to annotate the VCF files for chromosome 22. Similar commands were also applied to chromosome X.

```{bash}
# Declare variables
inVcfFile=ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf
outVcfFile=ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.annotated.vcf

# Gunzip the VCF file
gunzip $inVcfFile.gz

# Install VEP
#   Steps not provided.
#   See http://www.ensembl.org/info/docs/tools/vep/index.html for instructions.
#   Make sure to install the cache.

# Run VEP
perl ensembl-tools-release-75/scripts/variant_effect_predictor/variant_effect_predictor.pl -i $inVcfFile \
    --cache \
    --dir ensembl-tools-release-75/scripts/variant_effect_predictor/cache \
    --sift b \ 
    --polyphen b \
    --symbol \
    --numbers \
    --biotype \
    --total_length \
    --force_overwrite \
    --offline \
    --fork $numForks \
    -o $outVcfFile \
    --vcf \
    --fields Consequence,Codons,Amino_acids,Gene,SYMBOL,Feature,EXON,PolyPhen,SIFT,Protein_position,BIOTYPE
```

Below is Python code to filter the VCF files so that they only include "high" and/or "medium" severity variants. The code also filters the annotated VCF files for chromosomes 22 and X.

```{python}
import os, sys, gzip

def filterVepVCFFile(inVcfFilePath, outVcfFilePath, outSummaryFilePath, severitiesToKeep):
    # Specify severity options. I used a set because it will be faster below.
    severitiesToKeep = set(severitiesToKeep)

    # This will record the frequncy of each type of variant
    frequencyDict = {}
    
    variantsRetained = 0

    outVcfFile = open(outVcfFilePath, 'w')
    inVcfFile = gzip.open(inVcfFilePath)
    
    for line in inVcfFile:
        # Save each header line to the output file and move on
        if line.startswith("#"):
            outVcfFile.write(line)
            continue
    
        # Split the line on tab characters
        lineItems = line.rstrip().split("\t")

        # Create a list of the annotations
        annotations = lineItems[7].split(";")

        # Extract the CSQ annotation
        csqAnnotation = [x for x in annotations if x.startswith("CSQ=")][0]
        csqAnnotation = csqAnnotation.replace("CSQ=", "")

        # Extract the severity levels for this annotation and put it in a set object
        severities = set()
        for x in csqAnnotation.split(","):
            for y in x.split("|")[0].split("&"):
                severities.add(y)

        # Increment the dictionary count if we found a variant that matches our criteria.
        # Use a flag to indicate that we only want to write the line to the file once.
        shouldWrite = False
        for severity in severitiesToKeep:
            if severity in severities:
                shouldWrite = True
                frequencyDict[severity] = frequencyDict.setdefault(severity, 0) + 1
                variantsRetained += 1

        if shouldWrite:
            outVcfFile.write(line)

    inVcfFile.close()
    outVcfFile.close()

    # Print to the output file
    outSummaryFile = open(outSummaryFilePath, 'w')
    for severity in sorted(list(frequencyDict.keys())):
        outSummaryFile.write("%s\t%i\n" % (severity, frequencyDict[severity]))
    outSummaryFile.close()
    
    # Display the summary file
    !cat $outSummaryFilePath
    print "%i variants retained" % variantsRetained

# Filter chr22 file
filterVepVCFFile("ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.annotated.vcf.gz", "ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.annotated.HIGHseverity.vcf", "ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.annotated.HIGHseverity.summary.txt", ["splice_acceptor_variant", "splice_donor_variant", "stop_gained", "stop_lost", "frameshift_variant", "start_lost", "exon_loss_variant", "initiator_codon_variant", "initiator_codon_variant", "chromosomal_deletion", "rare_amino_acid_variant"])

# Filter chrX file
filterVepVCFFile("ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.annotated.vcf.gz", "ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.annotated.HIGHseverity.vcf", "ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.annotated.HIGHseverity.summary.txt", ["splice_acceptor_variant", "splice_donor_variant", "stop_gained", "stop_lost", "frameshift_variant", "start_lost", "exon_loss_variant", "initiator_codon_variant", "initiator_codon_variant", "chromosomal_deletion", "rare_amino_acid_variant", "missense_variant", "inframe_insertion", "inframe_deletion", "coding_sequence_variant", "disruptive_inframe_deletion", "disruptive_inframe_insertion", "5_prime_UTR_truncation + exon_loss_variant", "3_prime_UTR_truncation + exon_loss_variant", "splice_region_variant", "mature_miRNA_variant", "regulatory_region_variant", "TF_binding_site_variant", "regulatory_region_ablation", "regulatory_region_amplification", "TFBS_ablation", "TFBS_amplification"])
```

## Obtain sample annotations

I downloaded information about the 1000 Genomes Project from [here](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/working/20130606_sample_info/20130606_sample_info.xlsx). This file indicates which population each sample belongs to, whether they are male or female, etc. I opened this in Excel and saved it as a tab-delimited text file so it would be easier to import the data into Python. The following function displays the first few rows and columns of the sample information file. I used Python for this because Excel gave the file some weird line endings.

```{python}
import os, sys

def displayFirstFewLinesAndColumns(filePath, numRows, numCols):
    lineCount = 0
    for line in file(filePath, 'rU'): # Specifying that this is a Unicode file helps to deal with the line endings
        lineItems = line.rstrip().split("\t")

        print lineItems[:numRows]
    
        lineCount += 1
        if lineCount > numCols:
            break

sampleInfoFilePath = "1000Genomes_20130606_sample_info.txt"
displayFirstFewLinesAndColumns(sampleInfoFilePath, 5, 6)
```

## Variant reformatting and summarization

The following code extracts the variants from the VCF files, merges them with the sample information, and saves them in a format that is easier to import into R for the principal component analysis. I have parsed the VCF files so that for each person, it converts the genotype values to 0, 1, or 2, depending on how many minor alleles a given person had. For example, a value of ```0|0``` would be converted to 0, ```0|1``` or ```1|0``` would be converted to 1, and ```1|1``` would be converted to 2. In some cases, where there are multiple alternate alleles, you will see values such as ```0|2```, ```2|0```, ```2|2```, ```0|3```, etc. These values should be treated the same way you would treat ```0|1``` or ```1|0```, etc.

```{python}
# Python code to parse genotypes

def parseAndReformatVariants(vcfFilePath, outVariantFilePath):
    # Initialize dictionaries that will contain sample information
    sampleFamilyDict = {}
    samplePopulationDict = {}
    sampleGenderDict = {}

    # Parse sample information from file and put it in dictionaries
    sampleInfoFile = open(sampleInfoFilePath, 'rU')
    sampleInfoFile.readline() # Remove header line

    for line in sampleInfoFile:
        # Extract tab-delimited values and remove white space at the end of the line
        lineItems = line.rstrip().split("\t")
    
        sampleFamilyDict[lineItems[0]] = lineItems[1]
        samplePopulationDict[lineItems[0]] = lineItems[2]
        sampleGenderDict[lineItems[0]] = lineItems[4]

    # This will be a dictionary of dictionaries
    variantDict = {}

    for line in file(vcfFilePath):
        # Ignore any meta line in the header
        if line.startswith("##"):
            continue

        # Pull the sample ideas from the final header line
        if line.startswith("#"):
            sampleIDs = line.rstrip().split("\t")[9:]
            continue

        # This is where we start to extract the variants
        lineItems = line.rstrip().split("\t")
        variantID = lineItems[0] + "__" + lineItems[1]

        # Convert the text-based genotype information to a count of the number of alternate alleles.
        genotypes = [summarizeGenotype(genotype) for genotype in lineItems[9:]]
    
        # If there are any missing or ambiguous genotypes, ignore the entire row (for now)
        if -1 in genotypes:
            continue

        # Store the variant information in the dictionary of dictionaries
        variantDict[variantID] = {}
        for i in range(len(sampleIDs)):
            variantDict[variantID][sampleIDs[i]] = genotypes[i]

    variantIDs = sorted(variantDict.keys())

    outSampleFile = open("/Users/srp33/Dropbox/Teaching/BIO465/Analysis_Exercises/1000GData/SampleInfo.txt", 'w')
    variantFile = open(outVariantFilePath, 'w')
    
    outSampleFile.write("\t".join(["SampleID", "FamilyID", "Population", "Gender"]) + "\n")
    
    # Save the header line to the output file
    # The "join" function comes in handy for saving tab-delimited information to files
    variantFile.write("\t".join(["SampleID"] + variantIDs) + "\n")

    numSamplesSaved = 0

    # Save variants for each sample ID
    for sampleID in sampleIDs:
        variantCalls = [variantDict[variantID][sampleID] for variantID in variantIDs]
        outSampleFile.write("\t".join([sampleID, sampleFamilyDict[sampleID], samplePopulationDict[sampleID], sampleGenderDict[sampleID]]) + "\n")
        variantFile.write("\t".join([sampleID] + [str(x) for x in variantCalls]) + "\n")

    variantFile.close()

def summarizeGenotype(x):
    genotypes = x.split("|")
    
    # If there is a missing value ("." or just a single genotype), we want to treat it a little differently
    if len(genotypes) == 1:
        return -1
    
    # Non-reference alleles are specified as non-zeroes values
    numZeroes = int(genotypes[0] != "0") + int(genotypes[1] != "0")

    # This returns the total number of alleles
    if numZeroes == 0:
        return 0
    if numZeroes == 1:
        return 1
    return 2

parseAndReformatVariants("/Users/srp33/Dropbox/Teaching/BIO465/Analysis_Exercises/1000GData/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.annotated.HIGHseverity.vcf", "/Users/srp33/Dropbox/Teaching/BIO465/Analysis_Exercises/1000GData/chr22.HIGH.variants.txt")
parseAndReformatVariants("/Users/srp33/Dropbox/Teaching/BIO465/Analysis_Exercises/1000GData/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.annotated.HIGHseverity.vcf", "/Users/srp33/Dropbox/Teaching/BIO465/Analysis_Exercises/1000GData/chrX.HIGH.variants.txt")
```

The following bash commands print the first few lines of the files, count the number of variants, etc.

```{bash}
# Display the first few lines of these files

displayFirstFewLinesAndColumns("chr22.HIGH.variants.txt", 8, 8)
displayFirstFewLinesAndColumns("chrX.HIGH.variants.txt", 8, 8)

# Count the number of rows in each file
!wc -l chr22.HIGH.variants.txt
!wc -l chrX.HIGH.variants.txt

# Count the number of columns in each file
!awk '{print NF}' chr22.HIGH.variants.txt | sort -nu | tail -n 1
!awk '{print NF}' chrX.HIGH.variants.txt | sort -nu | tail -n 1
```