mkdir -p bin
if [ ! -f draco.o ]; then
  echo 'building draco...'
  emcc -s WASM=1 -s USE_PTHREADS=1 -O3 \
		draco/mesh/mesh_misc_functions.cc \
		draco/mesh/mesh_attribute_corner_table.cc \
		draco/mesh/corner_table.cc \
		draco/mesh/mesh_cleanup.cc \
		draco/mesh/triangle_soup_mesh_builder.cc \
		draco/mesh/mesh_stripifier.cc \
		draco/mesh/mesh_are_equivalent.cc \
		draco/mesh/mesh.cc \
		draco/point_cloud/point_cloud_builder.cc \
		draco/point_cloud/point_cloud.cc \
		draco/core/bounding_box.cc \
		draco/core/bit_utils.cc \
		draco/core/data_buffer.cc \
		draco/core/hash_utils.cc \
		draco/core/cycle_timer.cc \
		draco/core/divide.cc \
		draco/core/quantization_utils.cc \
		draco/core/options.cc \
		draco/core/decoder_buffer.cc \
		draco/core/encoder_buffer.cc \
		draco/core/draco_types.cc \
		draco/attributes/point_attribute.cc \
		draco/attributes/attribute_octahedron_transform.cc \
		draco/attributes/attribute_quantization_transform.cc \
		draco/attributes/geometry_attribute.cc \
		draco/attributes/attribute_transform.cc \
		draco/compression/mesh/mesh_edgebreaker_decoder_impl.cc \
		draco/compression/mesh/mesh_edgebreaker_decoder.cc \
		draco/compression/mesh/mesh_decoder.cc \
		draco/compression/mesh/mesh_sequential_decoder.cc \
		draco/compression/point_cloud/point_cloud_kd_tree_decoder.cc \
		draco/compression/point_cloud/point_cloud_sequential_decoder.cc \
		draco/compression/point_cloud/point_cloud_decoder.cc \
		draco/compression/point_cloud/algorithms/float_points_tree_decoder.cc \
		draco/compression/point_cloud/algorithms/dynamic_integer_points_kd_tree_decoder.cc \
		draco/compression/entropy/symbol_encoding.cc \
		draco/compression/entropy/shannon_entropy.cc \
		draco/compression/entropy/symbol_decoding.cc \
		draco/compression/bit_coders/adaptive_rans_bit_encoder.cc \
		draco/compression/bit_coders/symbol_bit_encoder.cc \
		draco/compression/bit_coders/direct_bit_decoder.cc \
		draco/compression/bit_coders/rans_bit_decoder.cc \
		draco/compression/bit_coders/adaptive_rans_bit_decoder.cc \
		draco/compression/bit_coders/symbol_bit_decoder.cc \
		draco/compression/bit_coders/rans_bit_encoder.cc \
		draco/compression/bit_coders/direct_bit_encoder.cc \
		draco/compression/attributes/sequential_integer_attribute_decoder.cc \
		draco/compression/attributes/sequential_attribute_decoder.cc \
		draco/compression/attributes/sequential_attribute_decoders_controller.cc \
		draco/compression/attributes/sequential_quantization_attribute_decoder.cc \
		draco/compression/attributes/sequential_normal_attribute_decoder.cc \
		draco/compression/attributes/kd_tree_attributes_decoder.cc \
		draco/compression/attributes/attributes_decoder.cc \
		draco/compression/decode.cc \
		draco/metadata/metadata.cc \
		draco/metadata/geometry_metadata.cc \
		draco/metadata/metadata_decoder.cc \
		draco/compression/mesh/mesh_edgebreaker_encoder_impl.cc \
		draco/compression/mesh/mesh_encoder.cc \
		draco/compression/mesh/mesh_sequential_encoder.cc \
		draco/compression/mesh/mesh_edgebreaker_encoder.cc \
		draco/compression/point_cloud/algorithms/dynamic_integer_points_kd_tree_encoder.cc \
		draco/compression/point_cloud/algorithms/float_points_tree_encoder.cc \
		draco/compression/point_cloud/point_cloud_kd_tree_encoder.cc \
		draco/compression/point_cloud/point_cloud_encoder.cc \
		draco/compression/point_cloud/point_cloud_sequential_encoder.cc \
		draco/compression/attributes/sequential_normal_attribute_encoder.cc \
		draco/compression/attributes/sequential_quantization_attribute_encoder.cc \
		draco/compression/attributes/kd_tree_attributes_encoder.cc \
		draco/compression/attributes/attributes_encoder.cc \
		draco/compression/attributes/prediction_schemes/prediction_scheme_encoder_factory.cc \
		draco/compression/attributes/sequential_integer_attribute_encoder.cc \
		draco/compression/attributes/sequential_attribute_encoder.cc \
		draco/compression/attributes/sequential_attribute_encoders_controller.cc \
		draco/compression/encode.cc \
		draco/compression/expert_encode.cc \
		draco/metadata/metadata_encoder.cc \
		-I. \
		-o draco.o
fi
if [ ! -f physx.o ]; then
  echo 'building physx...'
  emcc -s WASM=1 -s USE_PTHREADS=1 -O3 \
  -IPhysX/physx/include -IPhysX/pxshared/include \
  -IPhysX/physx/source/foundation/include \
  -IPhysX/physx/source/pvd/include \
  -IPhysX/physx/source/simulationcontroller/include -IPhysX/physx/source/lowlevel/api/include \
  -IPhysX/physx/source/geomutils/include \
  -IPhysX/physx/source/scenequery/include \
  -IPhysX/physx/source/lowleveldynamics/include \
  -IPhysX/physx/source/lowlevel/software/include \
  -IPhysX/physx/source/lowlevelaabb/include \
  -IPhysX/physx/source/lowlevel/common/include/pipeline \
  -IPhysX/physx/source/lowlevel/common/include/utils \
  -IPhysX/physx/source/lowlevel/common/include/collision \
  -IPhysX/physx/source/geomutils/src -IPhysX/physx/source/geomutils/src/common -IPhysX/physx/source/geomutils/src/mesh -IPhysX/physx/source/geomutils/src/hf -IPhysX/physx/source/geomutils/src/convex -IPhysX/physx/source/geomutils/src/gjk \
  -IPhysX/physx/source/common/src \
  -IPhysX/physx/source/physx/src/buffering \
  -IPhysX/physx/source/physx/src \
  -IPhysX/physx/source/physxcooking/src/convex \
  -IPhysX/physx/source/physxcooking/src/mesh \
  -IPhysX/physx/source/physxextensions/src/serialization/File \
  -IPhysX/physx/source/physxcooking/src \
  -IPhysX/physx/source/simulationcontroller/src \
  -IPhysX/physx/source/geomutils/src/intersection \
  -IPhysX//physx/source/geomutils/src/ccd \
  -IPhysX/physx/source/geomutils/src/contact \
  -IPhysX/physx/source/geomutils/src/pcm \
  -IPhysX/physx/source/geomutils/src/distance \
  -IPhysX/physx/source/geomutils/src/sweep \
  PhysX/physx/source/geomutils/src/GuGeometryQuery.cpp \
  PhysX/physx/source/geomutils/src/GuMTD.cpp \
  PhysX/physx/source/common/src/CmMathUtils.cpp \
  PhysX/physx/source/physx/src/NpPhysics.cpp \
  PhysX/physx/source/physxcooking/src/Cooking.cpp \
  PhysX/physx/source/foundation/src/PsFoundation.cpp \
  PhysX/physx/source/physxextensions/src/ExtDefaultErrorCallback.cpp \
  PhysX/physx/source/physxextensions/src/ExtDefaultStreams.cpp \
  PhysX/physx/source/geomutils/src/GuSerialize.cpp \
  PhysX/physx/source/physx/src/NpFactory.cpp \
  PhysX/physx/source/geomutils/src/GuMeshFactory.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuMeshQuery.cpp \
  PhysX/physx/source/geomutils/src/convex/GuConvexMesh.cpp \
  PhysX/physx/source/physxcooking/src/convex/ConvexMeshBuilder.cpp \
  PhysX/physx/source/physx/src/NpMaterial.cpp \
  PhysX/physx/source/physx/src/NpAggregate.cpp \
  PhysX/physx/source/physx/src/NpConstraint.cpp \
  PhysX/physx/source/geomutils/src/convex/GuBigConvexData.cpp \
  PhysX/physx/source/physxcooking/src/convex/BigConvexDataBuilder.cpp \
  PhysX/physx/source/physx/src/NpRigidStatic.cpp \
  PhysX/physx/source/physx/src/NpArticulation.cpp \
  PhysX/physx/source/physxcooking/src/BVHStructureBuilder.cpp \
  PhysX/physx/source/geomutils/src/GuBVHStructure.cpp \
  PhysX/physx/source/physx/src/NpShapeManager.cpp \
  PhysX/physx/source/physxcooking/src/convex/ConvexHullBuilder.cpp \
  PhysX/physx/source/physx/src/NpActor.cpp \
  PhysX/physx/source/physx/src/NpArticulationLink.cpp \
  PhysX/physx/source/physx/src/NpRigidDynamic.cpp \
  PhysX/physx/source/physx/src/NpScene.cpp \
  PhysX/physx/source/simulationcontroller/src/ScArticulationCore.cpp \
  PhysX/physx/source/simulationcontroller/src/ScArticulationJointCore.cpp \
  PhysX/physx/source/simulationcontroller/src/ScStaticCore.cpp \
  PhysX/physx/source/simulationcontroller/src/ScNPhaseCore.cpp \
  PhysX/physx/source/simulationcontroller/src/ScActorCore.cpp \
  PhysX/physx/source/physxcooking/src/mesh/TriangleMeshBuilder.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuTriangleMesh.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuTriangleMeshRTree.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuTriangleMeshBV4.cpp \
  PhysX/physx/source/physxcooking/src/mesh/MeshBuilder.cpp \
  PhysX/physx/source/physx/src/buffering/ScbScene.cpp \
  PhysX/physx/source/scenequery/src/SqSceneQueryManager.cpp \
  PhysX/physx/source/physx/src/NpShape.cpp \
  PhysX/physx/source/foundation/src/unix/PsUnixMutex.cpp \
  PhysX/physx/source/geomutils/src/hf/GuHeightFieldUtil.cpp \
  PhysX/physx/source/simulationcontroller/src/ScBodyCore.cpp \
  PhysX/physx/source/simulationcontroller/src/ScShapeCore.cpp \
  PhysX/physx/source/simulationcontroller/src/ScRigidCore.cpp \
  PhysX/physx/source/simulationcontroller/src/ScConstraintCore.cpp \
  PhysX/physx/source/physx/src/NpBatchQuery.cpp \
  PhysX/physx/source/physx/src/NpSceneQueries.cpp \
  PhysX/physx/source/simulationcontroller/src/ScScene.cpp \
  PhysX/physx/source/foundation/src/PsTempAllocator.cpp \
  PhysX/physx/source/lowlevel/common/src/pipeline/PxcContactCache.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsContext.cpp \
  PhysX/physx/source/common/src/CmPtrTable.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuBV4.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuBV4Build.cpp \
  PhysX/physx/source/simulationcontroller/src/ScBodySim.cpp \
  PhysX/physx/source/simulationcontroller/src/ScRigidSim.cpp \
  PhysX/physx/source/simulationcontroller/src/ScArticulationSim.cpp \
  PhysX/physx/source/simulationcontroller/src/ScArticulationJointSim.cpp \
  PhysX/physx/source/simulationcontroller/src/ScConstraintSim.cpp \
  PhysX/physx/source/simulationcontroller/src/ScShapeSim.cpp \
  PhysX/physx/source/simulationcontroller/src/ScActorSim.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsIslandSim.cpp \
  PhysX/physx/source/physx/src/NpArticulationReducedCoordinate.cpp \
  PhysX/physx/source/simulationcontroller/src/ScConstraintGroupNode.cpp \
  PhysX/physx/source/simulationcontroller/src/ScSqBoundsManager.cpp \
  PhysX/physx/source/physxcooking/src/convex/ConvexPolygonsBuilder.cpp \
  PhysX/physx/source/simulationcontroller/src/ScPhysics.cpp \
  PhysX/physx/source/simulationcontroller/src/ScConstraintProjectionManager.cpp \
  PhysX/physx/source/physxcooking/src/MeshCleaner.cpp \
  PhysX/physx/source/scenequery/src/SqPruningStructure.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsSimpleIslandManager.cpp \
  PhysX/physx/source/physx/src/buffering/ScbBase.cpp \
  PhysX/physx/source/scenequery/src/SqAABBPruner.cpp \
  PhysX/physx/source/foundation/src/unix/PsUnixThread.cpp \
  PhysX/physx/source/foundation/src/unix/PsUnixSync.cpp \
  PhysX/physx/source/lowlevel/common/src/pipeline/PxcNpMemBlockPool.cpp \
  PhysX/physx/source/task/src/TaskManager.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsCCD.cpp \
  PhysX/physx/source/scenequery/src/SqBucketPruner.cpp \
  PhysX/physx/source/scenequery/src/SqExtendedBucketPruner.cpp \
  PhysX/physx/source/foundation/src/unix/PsUnixFPU.cpp \
  PhysX/physx/source/simulationcontroller/src/ScConstraintProjectionTree.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsNphaseImplementationContext.cpp \
  PhysX/physx/source/physxcooking/src/CookingUtils.cpp \
  PhysX/physx/source/foundation/src/unix/PsUnixSList.cpp \
  PhysX/physx/source/foundation/src/PsAllocator.cpp \
  PhysX/physx/source/scenequery/src/SqAABBTree.cpp \
  PhysX/physx/source/scenequery/src/SqPruningPool.cpp \
  PhysX/physx/source/simulationcontroller/src/ScConstraintInteraction.cpp \
  PhysX/physx/source/simulationcontroller/src/ScShapeInteraction.cpp \
  PhysX/physx/source/simulationcontroller/src/ScElementSim.cpp \
  PhysX/physx/source/common/src/CmVisualization.cpp \
  PhysX/physx/source/physxcooking/src/convex/VolumeIntegration.cpp \
  PhysX/physx/source/physxcooking/src/Adjacencies.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyFeatherstoneArticulation.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyFeatherstoneForwardDynamic.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyFeatherstoneInverseDynamic.cpp \
  PhysX/physx/source/common/src/CmRadixSort.cpp \
  PhysX/physx/source/common/src/CmRadixSortBuffered.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsContactManager.cpp \
  PhysX/physx/source/physxcooking/src/EdgeList.cpp \
  PhysX/physx/source/common/src/CmRenderOutput.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsMaterialCombiner.cpp \
  PhysX/physx/source/lowlevelaabb/src/BpAABBManager.cpp \
  PhysX/physx/source/lowlevel/common/src/pipeline/PxcNpBatch.cpp \
  PhysX/physx/source/lowlevel/common/src/pipeline/PxcNpThreadContext.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyThreadContext.cpp \
  PhysX/physx/source/physxcooking/src/convex/ConvexHullLib.cpp \
  PhysX/physx/source/physxcooking/src/convex/QuickHullConvexHullLib.cpp \
  PhysX/physx/source/physxcooking/src/convex/ConvexHullUtils.cpp \
  PhysX/physx/source/simulationcontroller/src/ScInteraction.cpp \
  PhysX/physx/source/scenequery/src/SqAABBTreeUpdateMap.cpp \
  PhysX/physx/source/lowleveldynamics/src/DySolverControl.cpp \
  PhysX/physx/source/lowleveldynamics/src/DySolverControlPF.cpp \
  PhysX/physx/source/lowleveldynamics/src/DySolverConstraints.cpp \
  PhysX/physx/source/lowleveldynamics/src/DySolverPFConstraints.cpp \
  PhysX/physx/source/lowleveldynamics/src/DySolverPFConstraintsBlock.cpp \
  PhysX/physx/source/lowleveldynamics/src/DySolverConstraintsBlock.cpp \
  PhysX/physx/source/geomutils/src/ccd/GuCCDSweepConvexMesh.cpp \
  PhysX/physx/source/geomutils/src/hf/GuHeightField.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuBV32.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuBV32Build.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyContactPrep.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyTGSContactPrep.cpp \
  PhysX/physx/source/lowlevel/common/src/pipeline/PxcNpContactPrepShared.cpp \
  PhysX/physx/source/lowlevelaabb/src/BpBroadPhase.cpp \
  PhysX/physx/source/lowlevelaabb/src/BpBroadPhaseABP.cpp \
  PhysX/physx/source/lowlevelaabb/src/BpBroadPhaseShared.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyArticulation.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyTGSDynamics.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyTGSContactPrepBlock.cpp \
  PhysX/physx/source/scenequery/src/SqIncrementalAABBPrunerCore.cpp \
  PhysX/physx/snippets/snippetutils/SnippetUtils.cpp \
  PhysX/physx/source/lowlevel/api/src/px_globals.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuMidphaseRTree.cpp \
  PhysX/physx/source/simulationcontroller/src/ScTriggerInteraction.cpp \
  PhysX/physx/source/geomutils/src/pcm/GuPersistentContactManifold.cpp \
  PhysX/physx/source/physxcooking/src/mesh/RTreeCooking.cpp \
  PhysX/physx/source/simulationcontroller/src/ScSimulationController.cpp \
  PhysX/physx/source/foundation/src/unix/PsUnixAtomic.cpp \
  PhysX/physx/source/scenequery/src/SqIncrementalAABBTree.cpp \
  PhysX/physx/source/physxcooking/src/mesh/HeightFieldCooking.cpp \
  PhysX/physx/source/geomutils/src/GuAABBTreeBuild.cpp \
  PhysX/physx/source/physx/src/buffering/ScbAggregate.cpp \
  PhysX/physx/source/foundation/src/PsMathUtils.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyArticulationSIMD.cpp \
  PhysX/physx/source/lowlevel/common/src/pipeline/PxcNpCacheStreamPair.cpp \
  PhysX/physx/source/simulationcontroller/src/ScSimStats.cpp \
  PhysX/physx/source/physxcooking/src/Quantizer.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyFrictionCorrelation.cpp \
  PhysX/physx/source/geomutils/src/GuInternal.cpp \
  PhysX/physx/source/geomutils/src/GuBox.cpp \
  PhysX/physx/source/lowlevelaabb/src/BpBroadPhaseMBP.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuRTree.cpp \
  PhysX/physx/source/geomutils/src/GuSweepTests.cpp \
  PhysX/physx/source/geomutils/src/GuRaycastTests.cpp \
  PhysX/physx/source/geomutils/src/GuOverlapTests.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuOverlapTestsMesh.cpp \
  PhysX/physx/source/geomutils/src/hf/GuOverlapTestsHF.cpp \
  PhysX/physx/source/foundation/src/PsString.cpp \
  PhysX/physx/source/physx/src/buffering/ScbShape.cpp \
  PhysX/physx/source/scenequery/src/SqCompoundPruner.cpp \
  PhysX/physx/source/geomutils/src/GuGeometryUnion.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuRTreeQueries.cpp \
  PhysX/physx/source/geomutils/src/mesh/GuSweepsMesh.cpp \
  PhysX/physx/source/geomutils/src/GuSweepMTD.cpp \
  PhysX/physx/source/geomutils/src/hf/GuSweepsHF.cpp \
  PhysX/physx/source/geomutils/src/GuSweepSharedTests.cpp \
  PhysX/physx/source/geomutils/src/GuCCTSweepTests.cpp \
  PhysX/physx/source/lowlevelaabb/src/BpBroadPhaseSap.cpp \
  PhysX/physx/source/geomutils/src/GuBounds.cpp \
  PhysX/physx/source/scenequery/src/SqCompoundPruningPool.cpp \
  PhysX/physx/source/foundation/src/unix/PsUnixPrintString.cpp \
  PhysX/physx/source/geomutils/src/gjk/GuGJKSimplex.cpp \
  PhysX/physx/source/physx/src/NpArticulationJoint.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyArticulationHelper.cpp \
  PhysX/physx/source/geomutils/src/common/GuBarycentricCoordinates.cpp \
  PhysX/physx/source/physx/src/NpArticulationJointReducedCoordinate.cpp \
  PhysX/physx/source/lowlevelaabb/src/BpBroadPhaseSapAux.cpp \
  PhysX/physx/source/lowlevel/common/src/pipeline/PxcContactMethodImpl.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyConstraintSetup.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyConstraintSetupBlock.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyArticulationContactPrep.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyArticulationContactPrepPF.cpp \
  PhysX/physx/source/geomutils/src/intersection/GuIntersection*.cpp \
  PhysX/physx/source/geomutils/src/pcm/GuPCMContact*.cpp \
  PhysX/physx/source/geomutils/src/contact/GuContact*.cpp \
  PhysX/physx/source/geomutils/src/sweep/GuSweep*.cpp \
  PhysX/physx/source/geomutils/src/distance/GuDistance*.cpp \
  PhysX/physx/source/geomutils/src/pcm/GuPCMShapeConvex.cpp \
  PhysX/physx/source/geomutils/src/convex/GuHillClimbing.cpp \
  PhysX/physx/source/geomutils/src/convex/GuConvexUtilsInternal.cpp \
  PhysX/physx/source/geomutils/src/convex/GuShapeConvex.cpp \
  PhysX/physx/source/geomutils/src/GuCapsule.cpp \
  PhysX/physx/source/geomutils/src/contact/GuFeatureCode.cpp \
  PhysX/physx/source/geomutils/src/common/GuSeparatingAxes.cpp \
  PhysX/physx/source/lowlevel/software/src/PxsDefaultMemoryManager.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyDynamics.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyConstraintPartition.cpp \
  PhysX/physx/source/geomutils/src/convex/GuConvexHelper.cpp \
  PhysX/physx/source/geomutils/src/ccd/GuCCDSweepPrimitives.cpp \
  PhysX/physx/source/geomutils/src/pcm/GuPCMTriangleContactGen.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyRigidBodyToSolverBody.cpp \
  PhysX/physx/source/lowleveldynamics/src/DyContactPrepPF.cpp \
  PhysX/physx/source/geomutils/src/gjk/GuEPA.cpp \
  PhysX/physx/source/physxextensions/src/ExtTriangleMeshExt.cpp \
  -DNDEBUG -DPX_SIMD_DISABLED -DPX_EMSCRIPTEN=1 -DPX_COOKING \
	-o physx.o
fi
if [ ! -f concaveman.o ]; then
  echo 'building concaveman...'
  emcc -s WASM=1 -s USE_PTHREADS=1 -O3 \
  -Iconcaveman \
  concaveman/concaveman.cpp \
  -o concaveman.o
fi
echo 'building main...'
# m = 64*1024; s = 350000000; Math.floor(s/m)*m;
emcc -s WASM=1 -s USE_PTHREADS=1 -s PTHREAD_POOL_SIZE=1 -s TOTAL_MEMORY=399966208 -s MALLOC=emmalloc -O3 \
  -IPhysX/physx/include -IPhysX/pxshared/include \
  -IPhysX/physx/source/foundation/include \
  -IPhysX/physx/source/pvd/include \
  -IPhysX/physx/source/simulationcontroller/include -IPhysX/physx/source/lowlevel/api/include \
  -IPhysX/physx/source/geomutils/include \
  -IPhysX/physx/source/scenequery/include \
  -IPhysX/physx/source/lowleveldynamics/include \
  -IPhysX/physx/source/lowlevel/software/include \
  -IPhysX/physx/source/lowlevelaabb/include \
  -IPhysX/physx/source/lowlevel/common/include/pipeline \
  -IPhysX/physx/source/lowlevel/common/include/utils \
  -IPhysX/physx/source/lowlevel/common/include/collision \
  -IPhysX/physx/source/geomutils/src -IPhysX/physx/source/geomutils/src/common -IPhysX/physx/source/geomutils/src/mesh -IPhysX/physx/source/geomutils/src/hf -IPhysX/physx/source/geomutils/src/convex -IPhysX/physx/source/geomutils/src/gjk \
  -IPhysX/physx/source/common/src \
  -IPhysX/physx/source/physx/src/buffering \
  -IPhysX/physx/source/physx/src \
  -IPhysX/physx/source/physxcooking/src/convex \
  -IPhysX/physx/source/physxcooking/src/mesh \
  -IPhysX/physx/source/physxextensions/src/serialization/File \
  -IPhysX/physx/source/physxcooking/src \
  -IPhysX/physx/source/simulationcontroller/src \
  -IPhysX/physx/source/geomutils/src/intersection \
  -IPhysX//physx/source/geomutils/src/ccd \
  -IPhysX/physx/source/geomutils/src/contact \
  -IPhysX/physx/source/geomutils/src/pcm \
  -IPhysX/physx/source/geomutils/src/distance \
  -IPhysX/physx/source/geomutils/src/sweep \
  -Iearcut \
  -IRectBinPack/include \
  -Iconcaveman \
  objectize.cc vector.cc subparcel.cc geometry.cc collide.cc \
  FastNoise.cpp noise.cc march.cc biomes.cc \
  draco.o physx.o concaveman.o \
  -DNDEBUG -DPX_SIMD_DISABLED -DPX_EMSCRIPTEN=1 -DPX_COOKING \
  -I. \
  -o bin/geometry.js
echo done